import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:fish_redux/fish_redux.dart';
import 'package:study/common/constants.dart';

class CommonUtils {
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }

  static Map getHeaders() {
    String currentTime = '${DateTime.now().millisecondsSinceEpoch}';
//    String currentTime = '1592467741392';
    String lcSign = '$currentTime${Constants.GUYUN_APPKEY}';
    String sign = generateMd5(lcSign);
    println('=========================$sign');
    Map<String, dynamic> map = Map();
    map['x-lc-id'] = Constants.GUYUN_APPID;
    map['x-lc-sign'] = '$sign,$currentTime';
    map['Content-Type'] = 'charset=UTF-8';
    println('=========================${map.toString()}');
    return map;
  }

  static Color randomColor() {
    return Color.fromARGB(255, Random().nextInt(256) + 0,
        Random().nextInt(256) + 0, Random().nextInt(256) + 0);
  }
}
