import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchComponentPage extends Page<SearchComponentState, Map<String, dynamic>> {
  SearchComponentPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchComponentState>(
                adapter: null,
                slots: <String, Dependent<SearchComponentState>>{
                }),
            middleware: <Middleware<SearchComponentState>>[
            ],);

}
