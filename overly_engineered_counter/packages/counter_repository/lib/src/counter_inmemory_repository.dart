part of 'counter_repository.dart';

class CounterInMemoryRepository implements CounterRepository {
  @visibleForTesting
  final CounterInMemoryClient client;

  CounterInMemoryRepository({
    CounterInMemoryClient? client,
  }) : client = client ?? CounterInMemoryClient();

  final _controller = BehaviorSubject<Counter>();

  Counter _counterFromClient() {
    final entity = client.getCounter();
    return Counter.fromEntity(entity);
  }

  void _updateCounter() {
    _controller.add(_counterFromClient());
  }

  @override
  Stream<Counter> get counter async* {
    yield _counterFromClient();
    yield* _controller.stream;
  }

  @override
  FutureOr<void> increment() {
    client.incrementCounter();
    _updateCounter();
  }

  @override
  FutureOr<void> close() => _controller.close();
}
