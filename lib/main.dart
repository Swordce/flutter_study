import 'dart:io';

import 'package:data_plugin/bmob/bmob.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart' hide Action,Page;
import 'package:flutter/material.dart' hide Action,Page;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:study/app/guyun/pages/author/page.dart';
import 'package:study/app/guyun/pages/highlight_content/page.dart';
import 'package:study/app/guyun/pages/home/page.dart';
import 'package:study/app/guyun/pages/splash/page.dart';

import 'app/guyun/pages/author_detail/page.dart';
import 'app/guyun/pages/collections/page.dart';
import 'app/guyun/pages/collections_detail/page.dart';
import 'app/guyun/pages/works_detail/page.dart';


void main() => runApp(createApp());

Widget createApp() {

  Bmob.init("https://api2.bmob.cn", "a5f16effe12a89c7feeca23672993d3c", "d40c043a7cb25e25");

  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'guyun_splash':SplashPage(),
      'guyun_home':HomePage(),
      'guyun_collections':CollectionsPage(),
      'guyun_collection_detail':CollectionDetailPage(),
      'guyun_author':AuthorPage(),
      'guyun_author_detail':AuthorDetailPage(),
      'guyun_works_detail':WorksDetailPage(),
      'guyun_highlight_content':HighlightPage(),
    },
  );

  return MaterialApp(
    title: 'GuYun',
    theme: ThemeData(
      primaryColor: Color(0xff545268)
    ),
    home: FlutterEasyLoading(
      child: Platform.isAndroid?routes.buildPage('guyun_splash', null):routes.buildPage('guyun_home', null),
    ),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return FlutterEasyLoading(
          child: routes.buildPage(settings.name, settings.arguments),
        );
      });
    },
  );
}