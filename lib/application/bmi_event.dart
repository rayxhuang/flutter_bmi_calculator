part of 'bmi_bloc.dart';

abstract class BmiEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChooseGenderMaleEvent extends BmiEvent{}

class ChooseGenderFemaleEvent extends BmiEvent{}

class ChooseHeightIncrementEvent extends BmiEvent{}

class ChooseHeightDecrementEvent extends BmiEvent{}

class ChooseWeightIncrementEvent extends BmiEvent{}

class ChooseWeightDecrementEvent extends BmiEvent{}

class CalculateBmiEvent extends BmiEvent{}