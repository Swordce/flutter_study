import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<CollectionsState> buildEffect() {
  return combineEffects(<Object, Effect<CollectionsState>>{
    CollectionsAction.action: _onAction,
  });
}

void _onAction(Action action, Context<CollectionsState> ctx) {
}
