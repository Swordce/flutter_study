import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/collection_bean.dart';
import 'package:study/app/guyun/bean/collection_detail_list.dart';
import 'package:study/common/constants.dart';
import 'package:study/utils/http_utils.dart';
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
  HttpUtils.getInstance().post('${Constants.GUYUN_API}getWorksByCollection',
      data: {'collectionId': ctx.state.collectionInfo.objectId,'page':page,'perPage':20},
      success: (result) {
        CollectionDetailListBean bean = CollectionDetailListBean.fromJson(result);
        if(bean!= null) {
          for(DetailList item in bean.result) {
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
      });
}

void _onInit(Action action, Context<CollectionDetailState> ctx) async {
  ctx.state.refreshController = RefreshController();

  Map<String, dynamic> map = Map();
  map['collectionId'] = ctx.state.collectionInfo.collectionId;
  HttpUtils.getInstance().post('${Constants.GUYUN_API}getCollectionById',
      data: {'collectionId': ctx.state.collectionInfo.objectId},
      success: (result) {
    CollectionDetailBean bean = CollectionDetailBean.fromJson(result);
    ctx.state.detailBean = bean.result;
    ctx.dispatch(CollectionDetailActionCreator.onRefresh());
  });
  ctx.state.page = 1;
  _loadData(ctx.state.page,ctx);
}
