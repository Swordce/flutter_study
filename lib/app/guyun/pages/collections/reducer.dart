import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CollectionsState> buildReducer() {
  return asReducer(
    <Object, Reducer<CollectionsState>>{
      CollectionsAction.action: _onAction,
    },
  );
}

CollectionsState _onAction(CollectionsState state, Action action) {
  final CollectionsState newState = state.clone();
  return newState;
}
