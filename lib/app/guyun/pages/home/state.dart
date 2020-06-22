import 'package:fish_redux/fish_redux.dart';
import 'package:study/app/guyun/bean/collections_data.dart';
import 'package:study/app/guyun/bean/search_author.dart';

class HomeState implements Cloneable<HomeState> {

  List<CollectionsData> kind = List();
  List<SearchAuthor> hotAuthors = List();


  @override
  HomeState clone() {
    return HomeState()
      ..hotAuthors = hotAuthors
      ..kind = kind;
  }
}

HomeState initState(Map<String, dynamic> args) {
  return HomeState();
}
