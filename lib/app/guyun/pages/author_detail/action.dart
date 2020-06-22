import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum AuthorDetailAction { action,refreshPage }

class AuthorDetailActionCreator {
  static Action onAction() {
    return const Action(AuthorDetailAction.action);
  }

  static Action onRefreshPage() {
    return const Action(AuthorDetailAction.refreshPage);
  }
}
