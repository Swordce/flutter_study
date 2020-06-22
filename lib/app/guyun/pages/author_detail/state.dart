import 'package:fish_redux/fish_redux.dart';
import 'package:study/app/guyun/bean/search_author.dart';

class AuthorDetailState implements Cloneable<AuthorDetailState> {

  SearchAuthor author;

  @override
  AuthorDetailState clone() {
    return AuthorDetailState()
    ..author = author;
  }
}

AuthorDetailState initState(Map<String, dynamic> args) {
  AuthorDetailState detailState = AuthorDetailState();
  detailState.author = args['author'];
  return detailState;
}
