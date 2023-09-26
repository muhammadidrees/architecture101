import 'package:counter_repository/src/client/client.dart';
import 'package:meta/meta.dart';

class CounterInMemoryClient {
  @visibleForTesting
  var counter = CounterEntity();

  CounterEntity getCounter() {
    return counter;
  }

  void incrementCounter() async {
    final previousCounterValue = counter.value ?? 0;
    counter = CounterEntity(value: previousCounterValue + 1);
  }
}
