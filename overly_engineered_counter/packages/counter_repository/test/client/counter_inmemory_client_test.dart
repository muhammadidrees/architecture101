import 'package:counter_repository/src/client/client.dart';
import 'package:test/test.dart';

void main() {
  final mockEnity = CounterEntity(value: 1);

  group('CounterInMemoryClient', () {
    group('getCounter', () {
      test('returns CounterEntity', () {
        final client = CounterInMemoryClient();
        expect(client.getCounter(), isA<CounterEntity>());
      });

      test('returns mockEntity when counter is mockEntity', () {
        final client = CounterInMemoryClient();
        client.counter = mockEnity;
        expect(client.getCounter(), mockEnity);
      });
    });

    group('incrementCounter', () {
      test('increments counter by 1', () {
        final client = CounterInMemoryClient();
        client.incrementCounter();
        expect(client.counter.value, 1);
      });

      test('increments counter by 2', () {
        final client = CounterInMemoryClient();
        client.incrementCounter();
        client.incrementCounter();
        expect(client.counter.value, 2);
      });
    });
  });
}
