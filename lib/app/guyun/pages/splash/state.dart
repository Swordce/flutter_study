import 'package:fish_redux/fish_redux.dart';

class SplashState implements Cloneable<SplashState> {

  int countDownTime = 3;

  @override
  SplashState clone() {
    return SplashState()
    ..countDownTime = countDownTime;
  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}
