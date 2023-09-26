part of 'model.dart';

class Counter extends Equatable {
  final int value;

  const Counter({
    this.value = 0,
  });

  factory Counter.fromEntity(CounterEntity entity) {
    return Counter(value: entity.value ?? 0);
  }

  Counter copyWith({
    int? value,
  }) {
    return Counter(
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'Counter{value: $value}';

  @override
  List<Object?> get props => [value];
}
