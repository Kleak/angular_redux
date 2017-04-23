import 'package:angular2/angular2.dart';
import 'package:angular2/platform/browser.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';
import 'package:basic/app_component.dart';
import 'package:basic/config.dart';
import 'package:basic/store.dart';
import 'package:redux/redux.dart';

void main() {
  //  config the app with the level
  final config = new AppConfig();
  final store = createStore();

  //  bootstrap our app with our store
  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(AppConfig, useValue: config),
    provide(LocationStrategy, useClass: HashLocationStrategy),
    provide(Store, useValue: store),
  ]);
}
