import 'package:counter_repository/counter_repository.dart';

void main() async {
  final counterRepository = CounterInMemoryRepository();
  final counter = counterRepository.counter;

  counter.listen((counter) {
    print('Counter: $counter');
  });

  await counterRepository.counter.first;

  await counterRepository.increment();
  await counterRepository.increment();

  counterRepository.close();
}
