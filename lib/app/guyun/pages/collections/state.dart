import 'package:fish_redux/fish_redux.dart';
import 'package:study/app/guyun/bean/collections_data.dart';

class CollectionsState implements Cloneable<CollectionsState> {
  List<CollectionsData> kind = List();
  int index = 0;

  @override
  CollectionsState clone() {
    return CollectionsState()
      ..index = index
      ..kind = kind;
  }
}

CollectionsState initState(Map<String, dynamic> args) {
  CollectionsState state = CollectionsState();
  state.kind = args['kind'];
  state.index = args['index'];
  return state;
}
