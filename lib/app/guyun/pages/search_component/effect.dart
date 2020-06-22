import 'package:fish_redux/fish_redux.dart';
import 'package:study/app/guyun/bean/search_author.dart';
import 'package:study/app/guyun/bean/search_works.dart';
import 'package:study/common/constants.dart';
import 'package:study/utils/http_utils.dart';
import 'action.dart';
import 'state.dart';

Effect<SearchComponentState> buildEffect() {
  return combineEffects(<Object, Effect<SearchComponentState>>{
    SearchComponentAction.action: _onAction,
    Lifecycle.initState:_onInit,
  });
}

void _onAction(Action action, Context<SearchComponentState> ctx) {
}

void _onInit(Action action, Context<SearchComponentState> ctx) async {
  if (ctx.state.searchType == 'author') {
    _searchAuthor(ctx);
  } else if (ctx.state.searchType == 'works') {
    _searchWorks(ctx);
  } else {
    _searchAuthor(ctx);
    _searchWorks(ctx);
  }
}

void _searchAuthor(Context<SearchComponentState> ctx) {
  Map<String, dynamic> map = Map();
  map['q'] = ctx.state.query;
  HttpUtils.getInstance().post('${Constants.GUYUN_API}searchAuthors', data: map,
      success: (result) {
        if (result['result'] != null && result['result'].length > 0) {
          SearchAuthorBean bean = SearchAuthorBean.fromJson(result);
          ctx.state.authors.clear();
          ctx.state.authors.addAll(bean.result);
          ctx.dispatch(SearchComponentActionCreator.onRefreshPage());
        }
      });
}

void _searchWorks(Context<SearchComponentState> ctx) {
  Map<String, dynamic> map = Map();
  map['q'] = ctx.state.query;
  HttpUtils.getInstance().post('${Constants.GUYUN_API}searchWorks2', data: map,
      success: (result) {
        if (result['result'] != null && result['result'].length > 0) {
          WorksBean bean = WorksBean.fromJson(result);
          ctx.state.works.clear();
          ctx.state.works.addAll(bean.result);
          ctx.dispatch(SearchComponentActionCreator.onRefreshPage());
        }
      });
}
