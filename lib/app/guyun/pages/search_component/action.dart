import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SearchComponentAction { action,refreshPage }

class SearchComponentActionCreator {
  static Action onAction() {
    return const Action(SearchComponentAction.action);
  }

  static Action onRefreshPage() {
    return const Action(SearchComponentAction.refreshPage);
  }
}
