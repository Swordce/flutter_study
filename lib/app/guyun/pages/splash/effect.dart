import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    SplashAction.action: _onAction,
    Lifecycle.initState: _startCountDownTimer,
  });
}

void _onAction(Action action, Context<SplashState> ctx) {
}


void _startCountDownTimer(Action action, Context<SplashState> ctx) {
  Timer.periodic(Duration(seconds: 1), (timer) {
    if (ctx.state.countDownTime > 0) {
      ctx.state.countDownTime--;
    } else {
      timer.cancel();
      ctx.state.countDownTime = 3;
      Navigator.of(ctx.context).pushNamed('guyun_home');
    }
  });
}
