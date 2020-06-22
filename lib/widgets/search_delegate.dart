import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:study/app/guyun/bean/search_author.dart';
import 'package:study/app/guyun/pages/search_component/page.dart';

class searchBarDelegate extends SearchDelegate<String>{

  String searchType;
  List<SearchAuthor> hotAuthors;

  searchBarDelegate(this.searchType,this.hotAuthors):super(searchFieldLabel:searchType =='author'?'搜索作者':searchType == 'works'?'搜索作品':'搜索作者/作品');


  //重写右侧的图标
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear,color: Colors.black,),
        //将搜索内容置为空
        onPressed:() {
          query = "";
          showSuggestions(context);
        },
      )
    ];
  }
//重写返回图标
  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            color: Colors.black,
            progress: transitionAnimation
        ),
        //关闭上下文，当前页面
        onPressed: ()=>close(context,null)
    );
  }

  //重写搜索结果
  @override
  Widget buildResults(BuildContext context) {
    return SearchComponentPage().buildPage({'searchType':searchType,'query':query});
  }

  @override
  Widget buildSuggestions(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10,right: 5,top: 15),
          child: Text('热搜作者',style: TextStyle(fontSize: 16,color: Colors.black),),
        ),
        Container(
          padding: EdgeInsets.only(left: 10,right: 5,top: 15),
          child: Wrap(
            spacing: 10.0,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            children: _buildHotAuthor(),
          ),
        )
      ],
    );
  }

  List<Widget> _buildHotAuthor() {
    List<Widget> hots = List();
    for(SearchAuthor author in hotAuthors) {
      Widget widget = GestureDetector(
        child: Chip(
          label: Text(author.name),
        ),
        onTap: (){

        },
      );
      hots.add(widget);
    }
    return hots;
  }

}