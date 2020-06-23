import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/widgets/floatmenu/floating_menu.dart';
import 'package:study/widgets/floatmenu/floating_menu_callback.dart';
import 'package:study/widgets/floatmenu/floating_menu_item.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    WorksDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: <Widget>[
        Image.network(
          'http://cdn.xcz.im/img/wenku/xj-sc.jpg',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 80,
            sigmaX: 80,
          ),
          child: Container(
            color: Colors.black38,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () => Navigator.of(viewService.context).pop(),
          ),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: SafeArea(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(left: 15,right: 15,top: 55),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text('${state.work.title}',textAlign:TextAlign.center,style: TextStyle(fontSize: 20,color: Colors.white),),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(top: 5),
                          child: Text('${state.work.dynasty}·${state.work.authorName}',textAlign:TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.white),),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(top: 15,bottom: 10,),
                          child: Text('${state.work.content}',textAlign:TextAlign.justify,style: TextStyle(fontSize: 18,color: Colors.white),),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),

        Container(
          margin: EdgeInsets.only(bottom: 25,right: 15),
          child: FloatingMenu(
            menuList: state.menuList,
            callback: FloatingMenuClick(state,viewService.context),
            btnBackgroundColor: Colors.black54,
            preMenuIcon: Icons.lightbulb_outline,
            postMenuIcon: Icons.clear,
          ),
        ),
      ],
    ),
  );
}


class FloatingMenuClick implements FloatingMenuCallback {

  WorksDetailState state;
  BuildContext context;

  FloatingMenuClick(this.state, this.context);

  @override
  void onMenuClick(FloatingMenuItem menu) {
    switch(menu.id) {
      case 1:
        _showCupertinoDialog(state.work.annotation);
        break;
      case 2:
        _showCupertinoDialog(state.work.translation);
        break;
      case 3:
        _showCupertinoDialog(state.work.appreciation);
        break;
    }
  }

  void _showCupertinoDialog(String text) {
    var dialog = CupertinoAlertDialog(
      content: Text(
        "$text",
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16, wordSpacing: 1, letterSpacing: 1),
      ),
    );
    showDialog(context: context, builder: (_) => dialog);
  }

}
