part of 'bmi_bloc.dart';

abstract class BmiState extends Equatable {
  @override
  List<Object> get props => [];
}

class BmiInitial extends BmiState {}

class BmiCalculateState extends BmiState {}
