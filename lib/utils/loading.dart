import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtils {

  static void showLoading() {
    Future.delayed(Duration(milliseconds: 0))
        .then((value) => EasyLoading.show());
  }


  static void hideLoading() {
    Future.delayed(Duration(milliseconds: 0))
        .then((value) => EasyLoading.dismiss());
  }
}