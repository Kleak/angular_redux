import 'package:angular2/angular2.dart';
import 'package:basic/action/action.dart';
import 'package:basic/directives/mySpy.dart';
import 'package:basic/models/app_state.dart';
import 'package:redux/redux.dart';

@Component(
  selector: 'demo',
  templateUrl: './demo.html',
  styleUrls: const ['demo.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
  directives: const [SpyDirective],
)
class DemoComponent extends ComponentState implements OnInit {
  Store<AppState, AppActionBase> _store;

  num counter;

  DemoComponent(this._store);

  @override
  void ngOnInit() {
    _onStateChanged(_store.state);
    _store.onChange
        .where((AppState state) => counter != state.counter)
        .listen(_onStateChanged);
  }

  void _onStateChanged(AppState state) {
    counter = state.counter;
  }

  void increment() => _store.dispatch(new Increment());

  void decrement() => _store.dispatch(new Decrement());
}
