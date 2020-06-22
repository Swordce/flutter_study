import 'package:fish_redux/fish_redux.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:study/app/guyun/bean/all_collections.dart';
import 'package:study/app/guyun/bean/collection_bean.dart';
import 'package:study/app/guyun/bean/search_works.dart';
import 'package:study/app/guyun/bean/works_list.dart';

class CollectionDetailState implements Cloneable<CollectionDetailState> {

  Result collectionInfo;
  DetailInfo detailBean;
  List<Work> detailList = List();
  RefreshController refreshController;
  int page = 1;

  @override
  CollectionDetailState clone() {
    return CollectionDetailState()
    ..page = page
    ..refreshController = refreshController
    ..detailList = detailList
    ..detailBean = detailBean
    ..collectionInfo = collectionInfo;
  }
}

CollectionDetailState initState(Map<String, dynamic> args) {
  CollectionDetailState state = CollectionDetailState();
  state.collectionInfo = args['collectionInfo'];
  return state;
}
