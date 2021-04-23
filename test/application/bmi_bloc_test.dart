import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bmi_app/application/bmi_bloc.dart';

void main() {
  final BmiBloc bloc = BmiBloc();

  blocTest(
    'Should change BmiState highlightGender property to 1 when male card pressed',
    build: () => bloc,
    act: (BmiBloc bloc) => bloc.add(ChooseGenderEvent(1)),
    expect: () => [BmiState(highlightGender: 1)],
  );
}