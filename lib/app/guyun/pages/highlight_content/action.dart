import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HighlightAction { action,refreshPage,loadData }

class HighlightActionCreator {
  static Action onAction() {
    return const Action(HighlightAction.action);
  }

  static Action onLoadData() {
    return const Action(HighlightAction.loadData);
  }

  static Action onRefreshPage() {
    return const Action(HighlightAction.refreshPage);
  }
}
