import 'package:fish_redux/fish_redux.dart';
import 'package:study/app/guyun/bean/search_works.dart';

class WorksDetailState implements Cloneable<WorksDetailState> {

  Work work;

  @override
  WorksDetailState clone() {
    return WorksDetailState()
    ..work = work;
  }
}

WorksDetailState initState(Map<String, dynamic> args) {
  WorksDetailState state = WorksDetailState();
  state.work = args['work'];
  return state;
}
