import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum HomeAction { action,refreshList }

class HomeActionCreator {
  static Action onAction() {
    return const Action(HomeAction.action);
  }

  static Action onRefresh() {
    return const Action(HomeAction.refreshList);
  }
}
