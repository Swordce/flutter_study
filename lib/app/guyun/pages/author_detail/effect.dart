import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<AuthorDetailState> buildEffect() {
  return combineEffects(<Object, Effect<AuthorDetailState>>{
    AuthorDetailAction.action: _onAction,
  });
}

void _onAction(Action action, Context<AuthorDetailState> ctx) {
}
