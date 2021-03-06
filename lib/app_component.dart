import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:basic/components/demo/demo.dart';

@Component(
  selector: 'my-app',
  templateUrl: './app_component.html',
  styleUrls: const ['./app_component.css'],
  directives: const [ROUTER_DIRECTIVES],
)
@RouteConfig(const [
  const Route(name: 'Demo', path: '/', useAsDefault: true, component: DemoComponent)
])
class AppComponent {
  final String title = 'Boilerplate for angular and redux';

  AppComponent();
}
