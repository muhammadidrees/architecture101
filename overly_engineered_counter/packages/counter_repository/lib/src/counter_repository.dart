import 'dart:async';

import 'package:counter_repository/counter_repository.dart';
import 'package:counter_repository/src/client/client.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'counter_inmemory_repository.dart';

abstract class CounterRepository {
  Stream<Counter> get counter;

  FutureOr<void> increment();

  FutureOr<void> close();
}
