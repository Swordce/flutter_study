import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/highlight_bean.dart';

class HighlightState implements Cloneable<HighlightState> {

  int page = 1;
  List<Quotes> quotes = List();
  RefreshController refreshController;

  @override
  HighlightState clone() {
    return HighlightState()
    ..refreshController = refreshController
      ..quotes = quotes
      ..page = page;
  }
}

HighlightState initState(Map<String, dynamic> args) {
  return HighlightState();
}
