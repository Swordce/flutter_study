import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AuthorDetailState state, Dispatch dispatch, ViewService viewService) {
  void _showCupertinoDialog(String text) {
    var dialog = CupertinoAlertDialog(
      content: Text(
        "$text",
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16, wordSpacing: 1, letterSpacing: 1),
      ),
    );

    showDialog(context: viewService.context, builder: (_) => dialog);
  }

  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      elevation: 1,
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
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10, right: 10,top: 15,bottom: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      '${state.author.name}',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                    child: Text(
                      '${state.author.dynasty}[${state.author.birthYear}年~${state.author.deathYear}年]',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 35,
              color: Colors.black12,
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                '简介',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10,top: 15,bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        child: state.author.desc != null
                            ? Text(
                          state.author.desc,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(fontSize: 15, color: Colors.black),
                        )
                            : Container(),
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 15,
                      ),
                    )
                  ],
                ),
              ),
              onTap: () => _showCupertinoDialog(state.author.desc),
            ),
          ],
        ),
      ),
    ),
  );
}
