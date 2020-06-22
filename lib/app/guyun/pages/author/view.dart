import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/all_author.dart';
import 'package:study/app/guyun/bean/collection_detail_list.dart';
import 'package:study/utils/common_utils.dart';
import 'package:study/widgets/search_delegate.dart';
import 'package:study/widgets/vertical_tabs.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AuthorState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildItem(Authors author) {
    String name = author.name;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
        child: Row(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: CommonUtils.randomColor(),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  child: Text(
                    name.substring(0, 1),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        name,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Text(
                        '作品：${author.worksCount}篇',
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Text(
                        author.desc,
                        style: TextStyle(color: Colors.black54, fontSize: 14),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
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
    appBar: AppBar(
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      elevation: 1,
      title: Text(
        '全部作者',
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
      actions: <Widget>[

        Container(
          margin: EdgeInsets.only(right: 15),
          child: GestureDetector(
            child: Image.asset(
              'assets/images/icon_search.png',
              width: 20,
              height: 20,
            ),
            onTap: () {
              showSearch(context: viewService.context, delegate: searchBarDelegate('author',state.hotAuthors),);
            },
          ),
        ),

        Container(
          margin: EdgeInsets.only(right: 15),
          child: Builder(
            builder: (context) {
              return GestureDetector(
                child: Image.asset(
                  'assets/images/icon_filter.png',
                  width: 24,
                  height: 24,
                ),
                onTap: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ),

      ],
    ),
    body: SafeArea(
      child: Column(
        children: <Widget>[
          state.authors != null && state.authors.length > 0
              ? Expanded(
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
                          body = Text("没有更多了~");
                        }
                        return Container(
                          height: 55.0,
                          child: Center(child: body),
                        );
                      },
                    ),
                    onLoading: () => dispatch(AuthorActionCreator.onLoadData()),
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            _buildItem(state.authors[index]),
                        separatorBuilder: (context, index) {
                          return Container(
                            child: Divider(
                              color: Colors.black12,
                              height: 0.5,
                            ),
                          );
                        },
                        itemCount:
                            state.authors != null && state.authors.length > 0
                                ? state.authors.length
                                : 10),
                  ),
                )
              : Container()
        ],
      ),
    ),
    endDrawer: Drawer(
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 25),
        itemCount: state.dynastys.length,
        itemBuilder: (context, index) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: Container(
            child: Padding(
              padding:
                  EdgeInsets.only(left: 15, top: 10, bottom: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Text(
                    state.dynastys[index],
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Visibility(
                    visible: state.dynastys[index] == state.dynasty,
                    child: Image.asset(
                      'assets/images/icon_selected.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            dispatch(AuthorActionCreator.onReloadAuthor(state.dynastys[index]));
            Navigator.pop(viewService.context);
          },
        ),
        separatorBuilder: (context, index) {
          return Container(
            child: Divider(
              color: Colors.black12,
              height: 0.5,
            ),
          );
        },
      ),
    ),
  );
}
