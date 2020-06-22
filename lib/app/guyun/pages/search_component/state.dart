import 'package:fish_redux/fish_redux.dart';
import 'package:study/app/guyun/bean/all_author.dart';
import 'package:study/app/guyun/bean/search_works.dart';

class SearchComponentState implements Cloneable<SearchComponentState> {
  String searchType;
  String query;
  List<Authors> authors = List();
  List<Works> works = List();

  @override
  SearchComponentState clone() {
    return SearchComponentState()
      ..authors = authors
      ..works = works
      ..searchType = searchType
      ..query = query;
  }
}

SearchComponentState initState(Map<String, dynamic> args) {
  SearchComponentState state = SearchComponentState();
  state.searchType = args['searchType'];
  state.query = args['query'];
  return state;
}
