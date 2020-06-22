import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AuthorDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthorDetailState>>{
      AuthorDetailAction.action: _onAction,
    },
  );
}

AuthorDetailState _onAction(AuthorDetailState state, Action action) {
  final AuthorDetailState newState = state.clone();
  return newState;
}
