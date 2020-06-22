import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<AuthorState> buildReducer() {
  return asReducer(
    <Object, Reducer<AuthorState>>{
      AuthorAction.refreshPage: _onRefreshPage,
    },
  );
}

AuthorState _onRefreshPage(AuthorState state, Action action) {
  final AuthorState newState = state.clone();
  return newState;
}
