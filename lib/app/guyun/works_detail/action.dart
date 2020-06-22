import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WorksDetailAction { action }

class WorksDetailActionCreator {
  static Action onAction() {
    return const Action(WorksDetailAction.action);
  }
}
