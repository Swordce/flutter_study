import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<SearchComponentState> buildReducer() {
  return asReducer(
    <Object, Reducer<SearchComponentState>>{
      SearchComponentAction.refreshPage: _onRefreshPage,
    },
  );
}

SearchComponentState _onRefreshPage(SearchComponentState state, Action action) {
  final SearchComponentState newState = state.clone();
  return newState;
}
