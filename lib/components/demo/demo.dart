import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:basic/action/action.dart';
import 'package:basic/directives/mySpy.dart';
import 'package:basic/models/app_state.dart';
import 'package:redux/redux.dart';

@Component(
  selector: 'page-1',
  templateUrl: './demo.html',
  changeDetection: ChangeDetectionStrategy.Stateful,
  directives: const [SpyDirective],
)
class Demo extends ComponentState implements OnInit {
  Store<AppState, AppActionBase> _store;

  num counter;

  Demo(this._store);

  @override
  void ngOnInit() {
    _onStateChanged(_store.state);
    _store.onChange
        .where((AppState state) => counter != state.counter)
        .listen(_onStateChanged);
  }

  void _onStateChanged(AppState state) {
    setState(() {
      counter = state.counter;
    });
  }

  Future<Null> increment() async {
    _store.dispatch(new Increment());
  }

  void decrement() {
    _store.dispatch(new Decrement());
  }
}
