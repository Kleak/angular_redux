import 'package:meta/meta.dart';

class AppState {
  final num counter;

  AppState({@required this.counter});

  AppState.initial() : counter = 0;

  AppState.cloneFrom(AppState old, {num newCounter})
      : counter = newCounter ?? old.counter;

  List<String> debugState() => ["counter = $counter"];

  @override
  String toString() {
    final sb = new StringBuffer();
    debugState().forEach(sb.writeln);
    return sb.toString();
  }
}
