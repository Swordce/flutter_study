import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AuthorAction { action,refreshPage,loadData,reloadAuthor }

class AuthorActionCreator {
  static Action onAction() {
    return const Action(AuthorAction.action);
  }

  static Action onReloadAuthor(String dynasty) {
    return Action(AuthorAction.reloadAuthor,payload: dynasty);
  }

  static Action onLoadData() {
    return Action(AuthorAction.loadData);
  }

  static Action onRefreshPage() {
    return const Action(AuthorAction.refreshPage);
  }
}
