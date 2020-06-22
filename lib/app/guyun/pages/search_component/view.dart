import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/app/guyun/bean/all_author.dart';
import 'package:study/app/guyun/bean/search_works.dart';

import 'state.dart';

Widget buildView(
    SearchComponentState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildAuthorItem(Authors author) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 10,top: 15,bottom: 15),
      child: GestureDetector(
        behavior:HitTestBehavior.opaque,
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                '${author.name}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Flexible(
              child: Container(),
            ),
            Container(
              child: Text(
                '${author.dynasty}',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ],
        ),
        onTap: ()=>Navigator.of(viewService.context).pushNamed('guyun_author_detail',arguments: {'author':author}),
      ),
    );
  }

  Widget _buildWorksItem(Works works) {
    return Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${works.work.title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                        '${works.highlightContent.replaceAll('\r\n', '')}',
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
                '[ ${works.work.dynasty} ]  ${works.work.authorName}',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            )
          ],
        ));
  }

  return Container(
    child: state.authors.length > 0 && state.works.length > 0
        ? CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  height: 40,
                  color: Colors.black12,
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text('作者 ${state.authors.length}'),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        (_buildAuthorItem(state.authors[index])),
                    childCount: state.authors.length),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 40,
                  color: Colors.black12,
                  padding: EdgeInsets.only(left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text('作品 ${state.works.length}'),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => (_buildWorksItem(state.works[index])),
                    childCount: state.works.length),
              ),
            ],
          )
        : state.authors.length > 0
            ? ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    _buildAuthorItem(state.authors[index]),
                separatorBuilder: (context, index) {
                  return Container(
                    child: Divider(
                      color: Colors.black12,
                      height: 0.5,
                    ),
                  );
                },
                itemCount: state.authors.length)
            : ListView.separated(
                itemBuilder: (context, index) =>
                    _buildWorksItem(state.works[index]),
                separatorBuilder: (context, index) {
                  return Container(
                    child: Divider(
                      color: Colors.black12,
                      height: 0.5,
                    ),
                  );
                },
                itemCount: state.works.length),
  );
}
