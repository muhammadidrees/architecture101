import 'package:counter_repository/counter_repository.dart';
import 'package:counter_repository/src/client/client.dart';
import 'package:test/test.dart';

void main() {
  const mockValue = 78;
  const mockEnity = CounterEntity(value: mockValue);

  group('Counter', () {
    group('initializes', () {
      test('with 0 if no value is passed', () {
        expect(Counter().value, 0);
      });

      test('with passed value', () {
        expect(Counter(value: mockValue).value, mockValue);
      });

      test('using .fromEntity with passed entity', () {
        expect(Counter.fromEntity(mockEnity).value, mockValue);
      });
    });

    group('copyWith', () {
      test('returns same model if no value is passed', () {
        final counter = Counter(value: mockValue);
        final copy = counter.copyWith();
        expect(counter, copy);
      });

      test('returns model with updated values', () {
        final counter = Counter(value: mockValue);
        final copy = counter.copyWith(value: 21);
        expect(copy.value, 21);
        expect(counter, isNot(copy));
      });
    });

    group('comparision', () {
      test('returns true if values are equal', () {
        expect(Counter(value: mockValue), Counter(value: mockValue));
      });

      test('returns false if values are not equal', () {
        expect(Counter(value: mockValue), isNot(Counter(value: 21)));
      });
    });
  });
}
