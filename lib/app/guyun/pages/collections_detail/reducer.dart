import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<CollectionDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<CollectionDetailState>>{
      CollectionDetailAction.refresh: _onRefresh,
    },
  );
}

CollectionDetailState _onRefresh(CollectionDetailState state, Action action) {
  final CollectionDetailState newState = state.clone();
  return newState;
}
