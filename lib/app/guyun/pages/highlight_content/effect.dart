import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/highlight_bean.dart';
import 'package:study/common/constants.dart';
import 'package:study/utils/http_utils.dart';
import 'action.dart';
import 'state.dart';

Effect<HighlightState> buildEffect() {
  return combineEffects(<Object, Effect<HighlightState>>{
    HighlightAction.action: _onAction,
    HighlightAction.loadData: _onLoadData,
    Lifecycle.initState: _onInit,
  });
}

void _onAction(Action action, Context<HighlightState> ctx) {}

void _onLoadData(Action action, Context<HighlightState> ctx) {
  ctx.state.page+=1;
  _loadData(ctx.state.page, ctx);
}


void _loadData(int page,Context<HighlightState> ctx) {
  Map<String, dynamic> map = Map();
  map['page'] = ctx.state.page;
  map['perPage'] = 20;
  HttpUtils.getInstance().post('${Constants.GUYUN_API}getQuotesIncludeCount',
      data: map, success: (result) {
        HighlightContentBean contentBean = HighlightContentBean.fromJson(result);
        if (contentBean != null) {
          ctx.state.quotes.addAll(contentBean.result.quotes);
          ctx.state.refreshController.loadComplete();
          if (contentBean.result.quotes.length < 20) {
            ctx.state.refreshController.loadNoData();
          }
        } else {
          ctx.state.refreshController.loadFailed();
        }
        ctx.dispatch(HighlightActionCreator.onRefreshPage());
      });
}

void _onInit(Action action, Context<HighlightState> ctx) async {
  ctx.state.refreshController = RefreshController();
  ctx.state.page = 1;
  _loadData(ctx.state.page, ctx);
}
