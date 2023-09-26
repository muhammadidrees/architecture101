import 'package:counter_repository/src/client/client.dart';
import 'package:test/test.dart';

void main() {
  const mockValue = 89;
  group('CounterEntity', () {
    group('initializes', () {
      test('with empty constructor', () {
        expect(CounterEntity(), isA<CounterEntity>());
      });

      test('with mockValue when passed', () {
        final counterEntity = CounterEntity(value: mockValue);
        expect(counterEntity.value, mockValue);
      });
    });
  });
}
