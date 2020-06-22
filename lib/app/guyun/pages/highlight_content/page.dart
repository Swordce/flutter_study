import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class HighlightPage extends Page<HighlightState, Map<String, dynamic>> {
  HighlightPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<HighlightState>(
                adapter: null,
                slots: <String, Dependent<HighlightState>>{
                }),
            middleware: <Middleware<HighlightState>>[
            ],);

}
