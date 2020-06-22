import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<WorksDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<WorksDetailState>>{
      WorksDetailAction.action: _onAction,
    },
  );
}

WorksDetailState _onAction(WorksDetailState state, Action action) {
  final WorksDetailState newState = state.clone();
  return newState;
}
