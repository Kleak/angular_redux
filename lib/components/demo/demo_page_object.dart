import 'dart:async';
import 'package:pageloader/objects.dart';

class DemoComponentPO {
  @ById("counterValue")
  PageLoaderElement counterValue;

  @ById("counter")
  PageLoaderElement counter;

  @ById("increment")
  PageLoaderElement _increment;

  @ById("decrement")
  PageLoaderElement _decrement;

  Future increment() => _increment.click();
  Future decrement() => _decrement.click();
}