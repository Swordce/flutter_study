import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CollectionsAction { action }

class CollectionsActionCreator {
  static Action onAction() {
    return const Action(CollectionsAction.action);
  }
}
