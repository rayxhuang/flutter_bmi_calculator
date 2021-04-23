part of 'bmi_bloc.dart';

@immutable
class BmiState extends Equatable {
  final int highlightGender;
  final int height;
  final int weight;
  final int age;
  final double bmi;

  BmiState({
    this.highlightGender = 2,
    this.height = 180,
    this.weight = 60,
    this.age = 30,
    this.bmi = 18.52,
  });

  BmiState copyWith({
    highlightGender,
    height,
    weight,
    age,
    bmi,
  }) {
    return BmiState(
      highlightGender: highlightGender ?? this.highlightGender,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
      bmi: bmi ?? this.bmi,
    );
  }

  @override
  List<Object> get props => [
    highlightGender,
    height,
    weight,
    age,
    bmi,
  ];
}