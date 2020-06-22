import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/all_author.dart';
import 'package:study/app/guyun/bean/search_works.dart';
import 'package:study/app/guyun/bean/works_list.dart';

class AuthorDetailState implements Cloneable<AuthorDetailState> {

  Authors author;
  List<Work> worksList = List();
  int page = 1;
  RefreshController refreshController;

  @override
  AuthorDetailState clone() {
    return AuthorDetailState()
    ..refreshController = refreshController
    ..page = page
    ..worksList = worksList
    ..author = author;
  }
}

AuthorDetailState initState(Map<String, dynamic> args) {
  AuthorDetailState detailState = AuthorDetailState();
  detailState.author = args['author'];
  return detailState;
}
