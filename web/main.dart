import 'package:angular2/angular2.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';
import 'package:basic/action/action.dart';
import 'package:basic/app_component.dart';
import 'package:basic/config.dart';
import 'package:basic/middlewares/logging.dart';
import 'package:basic/models/app_state.dart';
import 'package:basic/reducers/counter.dart';
import 'package:redux/redux.dart';

void main() {
  //  config the app with the level
  final config = new AppConfig();

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

  //  bootstrap our app with our store
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(AppConfig, useValue: config),
    provide(LocationStrategy, useClass: HashLocationStrategy),
    provide(Store, useValue: store),
  ]);
}
