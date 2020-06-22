import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/all_author.dart';
import 'package:study/app/guyun/bean/search_author.dart';

class AuthorState implements Cloneable<AuthorState> {
  var dynastys = [
    '不限',
    '商',
    '周',
    '秦',
    '汉',
    '三国',
    '晋',
    '南北朝',
    '隋',
    '唐',
    '五代',
    '宋',
    '金',
    '元',
    '明',
    '清',
    '现代'
  ];
  List<Authors> authors = List();
  int page = 1;
  String dynasty = '不限';
  RefreshController refreshController;

  List<SearchAuthor> hotAuthors = List();

  @override
  AuthorState clone() {
    return AuthorState()
      ..hotAuthors = hotAuthors
      ..dynasty = dynasty
      ..refreshController = refreshController
      ..page = page
      ..authors = authors
      ..dynastys = dynastys;
  }
}

AuthorState initState(Map<String, dynamic> args) {
  return AuthorState();
}
