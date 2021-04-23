import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bmi_app/application/bmi_bloc.dart';

void main() {
  final BmiBloc bloc = BmiBloc();

  blocTest(
    'Should emit ',
    build: () => bloc,
    //act: (bloc) => bloc.add(),
    //expect: () => [],
    // verify: (_) {
    //   verify(_networkInfo.isConnected).called(1);
    // }
  );
}