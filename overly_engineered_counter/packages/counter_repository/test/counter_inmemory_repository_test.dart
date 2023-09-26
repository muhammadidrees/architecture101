import 'package:counter_repository/counter_repository.dart';
import 'package:counter_repository/src/client/client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockCounterInMemoryClient extends Mock implements CounterInMemoryClient {}

class FakeCounterEntity extends Fake implements CounterEntity {
  @override
  int? get value => 50;
}

void main() {
  late CounterInMemoryClient counterInMemoryClient;
  final counterEntity = FakeCounterEntity();
  final counterFromEntity = Counter(value: 50);

  setUp(() {
    counterInMemoryClient = MockCounterInMemoryClient();

    when(() => counterInMemoryClient.getCounter()).thenReturn(counterEntity);
  });

  CounterInMemoryRepository createRepository() {
    return CounterInMemoryRepository(client: counterInMemoryClient);
  }

  group('CounterInMemeoryRespository', () {
    group('initializes', () {
      test('with empty construsctor', () {
        expect(() => CounterInMemoryRepository(), returnsNormally);
      });

      test('with passed client', () {
        final repository =
            CounterInMemoryRepository(client: counterInMemoryClient);
        expect(repository.client, counterInMemoryClient);
      });
    });

    group('counter', () {
      test('emit value from client initially', () async {
        final repository = createRepository();

        await expectLater(
          repository.counter,
          emits(counterFromEntity),
        );

        verify(() => counterInMemoryClient.getCounter()).called(1);
      });

      test('emits value from client after increment', () async {
        final repository = createRepository();

        repository.increment();

        await expectLater(
          repository.counter,
          emitsInOrder([counterFromEntity, counterFromEntity]),
        );

        verify(() => counterInMemoryClient.getCounter()).called(2);
      });
    });

    group('increment', () {
      test('calls incrementCounter on client', () {
        when(() => counterInMemoryClient.incrementCounter()).thenReturn(null);

        final repository = createRepository();
        repository.increment();
        verify(() => counterInMemoryClient.incrementCounter()).called(1);
      });
    });
  });
}
