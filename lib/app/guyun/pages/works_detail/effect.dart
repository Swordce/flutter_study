import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<WorksDetailState> buildEffect() {
  return combineEffects(<Object, Effect<WorksDetailState>>{
    WorksDetailAction.action: _onAction,
    Lifecycle.initState:_onInit,
  });
}

void _onAction(Action action, Context<WorksDetailState> ctx) {
}

void _onInit(Action action, Context<WorksDetailState> ctx) {

}

