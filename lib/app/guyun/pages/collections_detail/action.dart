import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum CollectionDetailAction { action,refresh,loadData }

class CollectionDetailActionCreator {
  static Action onAction() {
    return const Action(CollectionDetailAction.action);
  }

  static Action onLoadData() {
    return Action(CollectionDetailAction.loadData);
  }

  static Action onRefresh() {
    return const Action(CollectionDetailAction.refresh);
  }
}
