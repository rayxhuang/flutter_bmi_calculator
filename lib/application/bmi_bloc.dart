import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiState());

  @override
  Stream<BmiState> mapEventToState(
    BmiEvent event,
  ) async* {
    if (event is ChooseGenderEvent) {
      yield this.state.copyWith(highlightGender: event.gender);
    } else if (event is ChooseAgeIncrementEvent) {
      yield this.state.copyWith(age: this.state.age + 1);
    } else if (event is ChooseWeightIncrementEvent) {
      yield this.state.copyWith(weight: this.state.weight + 1);
    } else if (event is ChooseAgeDecrementEvent) {
      final currentAge = this.state.age;
      if (currentAge > 0) {
        yield this.state.copyWith(age: currentAge - 1);
      }
    } else if (event is ChooseWeightDecrementEvent) {
      final currentWeight = this.state.weight;
      if (currentWeight > 0) {
        yield this.state.copyWith(weight: currentWeight - 1);
      }
    } else if (event is ChooseHeightEvent) {
      final currentHeight = this.state.height;
      if (currentHeight <= 240 && currentHeight >= 60) {
        yield this.state.copyWith(height: event.height);
      }
    } else {
      final bmi = calculateBmi();
      print(bmi);
      yield this.state.copyWith(bmi: bmi);
    }
  }

  double calculateBmi() {
    return this.state.weight / pow(this.state.height / 100, 2);
  }
}
