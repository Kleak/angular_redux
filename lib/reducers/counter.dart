import 'package:basic/action/action.dart';
import 'package:basic/models/app_state.dart';
import 'package:redux/redux.dart';

class CounterReducer extends Reducer<AppState, AppActionBase> {

  @override
  AppState reduce(AppState state, AppActionBase action) {
    switch (action.action) {
      case AppAction.increment:
        return new AppState.cloneFrom(state, newCounter: state.counter + 1);
      case AppAction.decrement:
        return new AppState.cloneFrom(state, newCounter: state.counter - 1);
      default:
        return state;
    }
  }
}