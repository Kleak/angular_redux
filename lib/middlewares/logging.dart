import 'package:basic/action/action.dart';
import 'package:basic/models/app_state.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';

class LoggingMiddleware implements Middleware<AppState, AppActionBase> {
  @override
  void call(Store<AppState, AppActionBase> store, AppActionBase action,
      NextDispatcher next) {
    final logger = new Logger("state")
      ..info('${new DateTime.now()}: $action')
      ..info("Previous State");
    store.state.debugState().forEach(logger.info);
    next(action);
    logger.info("Current State");
    store.state.debugState().forEach(logger.info);
  }
}
