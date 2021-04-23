part of 'bmi_bloc.dart';

abstract class BmiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChooseGenderEvent extends BmiEvent{
  final int gender;
  ChooseGenderEvent(this.gender);

  @override
  List<Object?> get props => [gender];
}

class ChooseHeightEvent extends BmiEvent{
  final int height;
  ChooseHeightEvent(this.height);

  @override
  List<Object?> get props => [height];
}

class ChooseWeightIncrementEvent extends BmiEvent{}

class ChooseWeightDecrementEvent extends BmiEvent{}

class ChooseAgeIncrementEvent extends BmiEvent{}

class ChooseAgeDecrementEvent extends BmiEvent{}

class CalculateBmiEvent extends BmiEvent{}