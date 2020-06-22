import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WorksDetailPage extends Page<WorksDetailState, Map<String, dynamic>> {
  WorksDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WorksDetailState>(
                adapter: null,
                slots: <String, Dependent<WorksDetailState>>{
                }),
            middleware: <Middleware<WorksDetailState>>[
            ],);

}
