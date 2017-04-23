import 'package:basic/action/action.dart';
import 'package:basic/middlewares/logging.dart';
import 'package:basic/models/app_state.dart';
import 'package:basic/reducers/counter.dart';
import 'package:redux/redux.dart';

Store<AppState, AppActionBase> createStore() {
  //  All our reducers
  final counterReducer = new CounterReducer();

  //  init store
  final combined = new CombinedReducer<AppState, AppActionBase>([
    counterReducer,
  ]);

  final store = new Store<AppState, AppActionBase>(
    combined,
    initialState: new AppState.initial(),
    middleware: [new LoggingMiddleware()],
  );
  return store;
}