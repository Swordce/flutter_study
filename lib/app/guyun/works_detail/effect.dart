import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<WorksDetailState> buildEffect() {
  return combineEffects(<Object, Effect<WorksDetailState>>{
    WorksDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<WorksDetailState> ctx) {
}
