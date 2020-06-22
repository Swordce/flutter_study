import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<HighlightState> buildReducer() {
  return asReducer(
    <Object, Reducer<HighlightState>>{
      HighlightAction.refreshPage: _onRefreshPage,
    },
  );
}

HighlightState _onRefreshPage(HighlightState state, Action action) {
  final HighlightState newState = state.clone();
  return newState;
}
