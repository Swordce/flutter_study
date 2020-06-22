import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/works_list.dart';
import 'package:study/common/constants.dart';
import 'package:study/utils/http_utils.dart';
import 'action.dart';
import 'state.dart';

Effect<AuthorDetailState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorDetailState>>{
    AuthorDetailAction.action: _onAction,
    AuthorDetailAction.loadData: _onLoadData,
    Lifecycle.initState:_onInit,
  });
}

void _onAction(Action action, Context<AuthorDetailState> ctx) {
}

void _onLoadData(Action action, Context<AuthorDetailState> ctx) {
  ctx.state.page+=1;
  _loadData(ctx.state.page, ctx);
}

void _loadData(int page,Context<AuthorDetailState> ctx) {
  Map<String,dynamic> map = Map();
  map['authorId'] = ctx.state.author.objectId;
  map['page'] = ctx.state.page;
  map['perPage'] = 20;

  HttpUtils.getInstance().post('${Constants.GUYUN_API}getWorksByAuthor',data: map,
      success: (result) {
        if (result['result'] != null && result['result'].length > 0) {
          WorksListBean bean = WorksListBean.fromJson(result);
          if(bean!= null) {
            for(WorksList item in bean.result) {
              if(item.title != null && item.content != null) {
                ctx.state.worksList.add(item);
              }
            }
            ctx.state.refreshController.loadComplete();
            if( bean.result.length < 20) {
              ctx.state.refreshController.loadNoData();
            }
          }else {
            ctx.state.refreshController.loadFailed();
          }
          ctx.dispatch(AuthorDetailActionCreator.onRefreshPage());
        }
      });
}

void _onInit(Action action, Context<AuthorDetailState> ctx) async {
  ctx.state.refreshController = RefreshController();
  ctx.state.page = 1;
  _loadData(ctx.state.page, ctx);
}
