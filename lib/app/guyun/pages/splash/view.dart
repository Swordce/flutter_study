import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(SplashState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: SafeArea(
      child: Image.asset('assets/images/bg.jpg',width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
    ),
  );
}
