import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/app/guyun/bean/collections_data.dart';
import 'package:study/widgets/vertical_tabs.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    CollectionsState state, Dispatch dispatch, ViewService viewService) {

  List<Tab> getTabs(List<CollectionsData> kind) {
    List<Tab> tabs = List();
    for (CollectionsData item in kind) {
      Tab tab = Tab(
          child: Container(
        height: 50,
        alignment: Alignment.center,
        child: Text(
          item.title,
          style: TextStyle(fontSize: 15),
        ),
      ));
      tabs.add(tab);
    }
    return tabs;
  }

  List<Widget> getTabContents(List<CollectionsData> kind) {
    List<Widget> tabContents = List();
    for (CollectionsData item in kind) {
      Widget content = Container(
        child: GridView.builder(
          itemCount: item.result.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.825),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 15,bottom: 15),
              child: GestureDetector(
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(item.result[index].cover),
                      radius: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        item.result[index].name,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    )
                  ],
                ),
                onTap: () => Navigator.of(viewService.context).pushNamed(
                    'guyun_collection_detail',
                    arguments: {'collectionInfo': item.result[index]}),
              ),
            );
          },
          shrinkWrap: true,
        ),
      );
      tabContents.add(content);
    }
    return tabContents;
  }

  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      elevation: 1,
      title: Text(
        '全部分类',
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
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: state.kind != null && state.kind.length > 0
                  ? VerticalTabs(
                      tabsWidth: 80,
                      initialIndex: state.index,
                      contentScrollAxis: Axis.vertical,
                      indicatorColor: Colors.white,
                      selectedTabBackgroundColor: Colors.white,
                      tabs: getTabs(state.kind),
                      contents: getTabContents(state.kind))
                  : Container(),
            ),
          ),
        ],
      ),
    ),
  );
}
