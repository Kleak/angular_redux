enum AppAction {
  increment,
  decrement,
}

abstract class AppActionBase {
  final AppAction action;

  AppActionBase(this.action);

  @override
  String toString() => "$action";
}

class Increment extends AppActionBase {
  Increment() : super(AppAction.increment);
}

class Decrement extends AppActionBase {
  Decrement() : super(AppAction.decrement);
}