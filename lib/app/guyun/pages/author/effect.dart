import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/all_author.dart';
import 'package:study/app/guyun/bean/search_author.dart';
import 'package:study/common/constants.dart';
import 'package:study/utils/http_utils.dart';
import 'package:study/utils/loading.dart';
import 'action.dart';
import 'state.dart';

Effect<AuthorState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorState>>{
    AuthorAction.action: _onAction,
    AuthorAction.loadData: _onLoadData,
    AuthorAction.reloadAuthor: _onReloadAuthor,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<AuthorState> ctx) {}

void _onReloadAuthor(Action action, Context<AuthorState> ctx) {
  ctx.state.page = 1;
  ctx.state.dynasty = action.payload;
  ctx.state.authors.clear();
  _getAuthors(ctx);
}

void _onLoadData(Action action, Context<AuthorState> ctx) {
  ctx.state.page += 1;
  _getAuthors(ctx);
}

void _onInit(Action action, Context<AuthorState> ctx) async {
  ctx.state.refreshController = RefreshController();
  _getAuthors(ctx);
  _getHotAuthors(ctx);
}

void _getHotAuthors(Context<AuthorState> ctx) {
  HttpUtils.getInstance().post('${Constants.GUYUN_API}getHotAuthors',
      success: (result) {
        if (result['result'] != null && result['result'].length > 0) {
          SearchAuthorBean bean = SearchAuthorBean.fromJson(result);
          ctx.state.hotAuthors.clear();
          ctx.state.hotAuthors.addAll(bean.result);
        }
      });
}

void _getAuthors(Context<AuthorState> ctx) {
  String api ='';
  Map<String, dynamic> map = Map();
  map['page'] = ctx.state.page;
  map['perPage'] = 15;
  if (ctx.state.dynasty.isNotEmpty && ctx.state.dynasty != '不限') {
    map['dynasty'] = ctx.state.dynasty;
    api = '${Constants.GUYUN_API}getAuthorsIncludeCountByDynasty';
  }else {
    api = '${Constants.GUYUN_API}getHotAuthorsIncludeCountByLikers';
  }
  if(ctx.state.page == 1) {
    LoadingUtils.showLoading();
  }
  HttpUtils.getInstance().post(
      api,
      data: map, success: (result) {
    AllAuthorBean bean = AllAuthorBean.fromJson(result);
    if (bean != null) {
      ctx.state.authors.addAll(bean.result.authors);
      ctx.state.refreshController.loadComplete();
      if (bean.result.authors.length < 15) {
        ctx.state.refreshController.loadNoData();
      }
      ctx.dispatch(AuthorActionCreator.onRefreshPage());
    } else {
      ctx.state.refreshController.loadFailed();
    }
    if(ctx.state.page == 1) {
      LoadingUtils.hideLoading();
    }
  });
}
