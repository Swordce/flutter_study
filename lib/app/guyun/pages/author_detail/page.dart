import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AuthorDetailPage extends Page<AuthorDetailState, Map<String, dynamic>> {
  AuthorDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AuthorDetailState>(
                adapter: null,
                slots: <String, Dependent<AuthorDetailState>>{
                }),
            middleware: <Middleware<AuthorDetailState>>[
            ],);

}
