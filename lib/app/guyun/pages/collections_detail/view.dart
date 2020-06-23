import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/search_works.dart';
import 'package:study/app/guyun/bean/works_list.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CollectionDetailState state, Dispatch dispatch, ViewService viewService) {
  void _showCupertinoDialog(String text) {
    var dialog = CupertinoAlertDialog(
      content: Text(
        "$text",
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16, wordSpacing: 2, letterSpacing: 1),
      ),
    );

    showDialog(context: viewService.context, builder: (_) => dialog);
  }

  Widget _buildItem(Work item) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
        child:GestureDetector(
          behavior: HitTestBehavior.opaque,
          child:  Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          '${item.title}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.content != null
                              ? '${item.content.replaceAll('\r\n', '')}'
                              : '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '[ ${item.dynasty} ]  ${item.authorName}',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              )
            ],
          ),
          onTap: ()=> Navigator.of(viewService.context).pushNamed('guyun_works_detail',arguments: {'work':item}),
        ));
  }

  Widget _buildHeader() {
    return Container(
      height: 130,
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Row(
          children: <Widget>[
            Container(
              child: Image.network(
                state.collectionInfo.cover,
                width: 80,
                height: 80,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        state.collectionInfo.name,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      child: Text(
                        state.collectionInfo.shortDesc,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: Container(
                              child: state.detailBean != null
                                  ? Text(
                                      state.detailBean.desc,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    )
                                  : Container(),
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        if(state.detailBean !=null && state.detailBean.desc != null){
                          _showCupertinoDialog(state.detailBean.desc);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: <Widget>[
        Image.network(
          state.collectionInfo.cover,
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
        Column(
          children: <Widget>[
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 24,
                ),
                onPressed: () => Navigator.of(viewService.context).pop(),
              ),
            ),
            _buildHeader(),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  border: Border.all(color: Colors.black12, width: 0.5),
                  boxShadow: [
                    BoxShadow(color: Colors.white, offset: Offset(0.5, 0.5)),
                  ],
                ),
                child: Container(
                  alignment: Alignment.topLeft,
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
                        dispatch(CollectionDetailActionCreator.onLoadData()),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            _buildItem(state.detailList[index]),
                        itemCount: state.detailList != null &&
                                state.detailList.length > 0
                            ? state.detailList.length
                            : 0,
                        separatorBuilder: (context, index) {
                          return Container(
                            child: Divider(
                              color: Colors.black12,
                              height: 0.5,
                            ),
                          );
                        }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
