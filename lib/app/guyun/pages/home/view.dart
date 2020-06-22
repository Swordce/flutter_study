import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/app/guyun/bean/collections_data.dart';
import 'package:study/widgets/search_delegate.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(HomeState state, Dispatch dispatch, ViewService viewService) {
  Widget _buildQuickEntry(String title, String url) {
    return Expanded(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(url),
            radius: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Text(
              title,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItemHeader(CollectionsData item) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 15, right: 10),
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 10),
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                item.title,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(left: 10),
              child: Text(
                '${item.result.length} ${item.title}',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 10,
              ),
            ),
            Visibility(
              visible: item.result.length > 9 ? true : false,
              child: GestureDetector(
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Text(
                        '更多',
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: Colors.black54,
                      )
                    ],
                  ),
                ),
                onTap: () => Navigator.of(viewService.context).pushNamed(
                    'guyun_collections',
                    arguments: {'kind': state.kind, 'index': item.index - 1}),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItemContent(CollectionsData item) {
    return Container(
      child: GridView.builder(
        itemCount: item.result.length > 12 ? 12 : item.result.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1),
        itemBuilder: (context, index) {
          return Container(
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
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget _buildItem(CollectionsData item) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _buildItemHeader(item),
          SizedBox(
            height: 15,
          ),
          _buildItemContent(item),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            margin: EdgeInsets.only(top: 10, left: 15, right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    'http://static.xichuangzhu.com/aaa5b0e7-6172-48da-ac86-90457fb92e46.jpg',
                  )),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      child: _buildQuickEntry(
                          '作者', 'http://cdn.xcz.im/img/wenku/xj-ts.jpg'),
                      onTap: ()=>Navigator.of(viewService.context).pushNamed(
                        'guyun_author',),
                    ),
                  ),
                  _buildQuickEntry(
                      '名句', 'http://cdn.xcz.im/img/wenku/xj-sc.jpg'),
                  _buildQuickEntry(
                      '诗单', 'http://cdn.xcz.im/img/wenku/xj-gs.jpg'),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/icon_all.png',
                            width: 60,
                            height: 60,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              '分类',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      onTap: () => Navigator.of(viewService.context).pushNamed(
                          'guyun_collections',
                          arguments: {'kind': state.kind, 'index': 0}),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Divider(height: 0.5,color: Colors.black12,),
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
        '中华诗词',
        style: TextStyle(fontSize: 18, color: Colors.black),
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
              showSearch(context: viewService.context, delegate: searchBarDelegate('all',state.hotAuthors),);
            },
          ),
        ),
      ],
    ),
    body: SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => (_buildItem(state.kind[index])),
                childCount: state.kind.length),
          )
        ],
      ),
    ),
  );
}
