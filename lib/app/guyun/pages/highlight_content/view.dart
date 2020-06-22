import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/highlight_bean.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    HighlightState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildItem(Quotes item) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text('${item.quote}',style: TextStyle(fontSize: 15,color: Colors.blueAccent),),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text('${item.dynasty}  ${item.authorName}《${item.work.title}》',style: TextStyle(fontSize: 15,color: Colors.black54),),
          ),
        ],
      ),
    );
  }

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      elevation: 1,
      title: Text(
        '名句',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
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
        child: SmartRefresher(
          enablePullUp: true,
          enablePullDown: false,
          controller: state.refreshController,
          footer: CustomFooter(
            builder: (context, mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = Text('上拉加载');
              } else if (mode == LoadStatus.loading) {
                body = CupertinoActivityIndicator();
              } else if (mode == LoadStatus.failed) {
                body = Text("加载失败!");
              } else {
                body = Text("没有更多数据了~");
              }
              return Container(
                height: 55.0,
                child: Center(child: body),
              );
            },
          ),
          onLoading: () =>
              dispatch(HighlightActionCreator.onLoadData()),
          child: ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: _buildItem(state.quotes[index]),
                onTap: ()=> Navigator.of(viewService.context).pushNamed('guyun_works_detail',arguments: {'work':state.quotes[index].work}),
              ),
              separatorBuilder: (context, index) {
                return Container(
                  child: Divider(
                    color: Colors.black12,
                    height: 0.5,
                  ),
                );
              },
              itemCount: state.quotes.length > 0 ? state.quotes.length : 0),
        ),
      ),
    ),
  );
}
