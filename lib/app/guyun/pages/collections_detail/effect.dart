import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/collection_bean.dart';
import 'package:study/app/guyun/bean/search_works.dart';
import 'package:study/app/guyun/bean/works_list.dart';
import 'package:study/common/constants.dart';
import 'package:study/utils/http_utils.dart';
import 'package:study/utils/loading.dart';
import 'action.dart';
import 'state.dart';

Effect<CollectionDetailState> buildEffect() {
  return combineEffects(<Object, Effect<CollectionDetailState>>{
    CollectionDetailAction.action: _onAction,
    CollectionDetailAction.loadData: _onLoadData,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<CollectionDetailState> ctx) {}

void _onLoadData(Action action, Context<CollectionDetailState> ctx) {
  ctx.state.page+=1;
  _loadData(ctx.state.page, ctx);
}

void _loadData(int page,Context<CollectionDetailState> ctx) {
  LoadingUtils.showLoading();
  HttpUtils.getInstance().post('${Constants.GUYUN_API}getWorksByCollection',
      data: {'collectionId': ctx.state.collectionInfo.objectId,'page':page,'perPage':20},
      success: (result) {
        WorksListBean bean = WorksListBean.fromJson(result);
        if(bean!= null) {
          for(Work item in bean.result) {
            if(item.title != null && item.content != null) {
              ctx.state.detailList.add(item);
            }
          }
          ctx.state.refreshController.loadComplete();
          if( bean.result.length < 20) {
            ctx.state.refreshController.loadNoData();
          }
        }else {
          ctx.state.refreshController.loadFailed();
        }
        ctx.dispatch(CollectionDetailActionCreator.onRefresh());
        LoadingUtils.hideLoading();
      });
}

void _onInit(Action action, Context<CollectionDetailState> ctx) async {
  ctx.state.refreshController = RefreshController();

  Map<String, dynamic> map = Map();
  map['collectionId'] = ctx.state.collectionInfo.objectId;
  HttpUtils.getInstance().post('${Constants.GUYUN_API}getCollectionById',
      data: map,
      success: (result) {
    CollectionDetailBean bean = CollectionDetailBean.fromJson(result);
    ctx.state.detailBean = bean.result;
    ctx.dispatch(CollectionDetailActionCreator.onRefresh());
  });
  ctx.state.page = 1;
  _loadData(ctx.state.page,ctx);
}
