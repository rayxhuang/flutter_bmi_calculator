import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiInitial());

  @override
  Stream<BmiState> mapEventToState(
    BmiEvent event,
  ) async* {

  }
}
