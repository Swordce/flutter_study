import 'package:fish_redux/fish_redux.dart';
import 'package:study/app/guyun/bean/all_author.dart';
import 'package:study/app/guyun/bean/collections_data.dart';

class HomeState implements Cloneable<HomeState> {

  List<CollectionsData> kind = List();
  List<Authors> hotAuthors = List();


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
