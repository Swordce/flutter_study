import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WorksDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      elevation: 1,
      title: Text('文章详情',style: TextStyle(fontSize: 18,color: Colors.black),),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 24,
        ),
        onPressed: () => Navigator.of(viewService.context).pop(),
      ),
    ),
    body: SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 25),
              alignment: Alignment.center,
              child: Text('${state.work.title}',style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              alignment: Alignment.center,
              child: Text('${state.work.dynasty}·${state.work.authorName}',style: TextStyle(fontSize: 14,color: Colors.black),),
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              alignment: Alignment.center,
              child: Text('${state.work.content}',style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
          ],
        ),
      ),
    ),
  );
}
