import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bmi_app/application/bmi_bloc.dart';
import 'package:flutter_bmi_app/presentation/components/constant.dart';
import 'package:flutter_bmi_app/presentation/components/display_card.dart';
import 'dart:math';

class MyBMIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => BmiBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title = 'BMI Calculator';

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiBloc, BmiState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: [
                        DisplayCard(DisplayIcon(Icons.male), Container()),
                        kSizedBoxW5,
                        DisplayCard(DisplayIcon(Icons.female), Container()),
                      ],
                    ),
                  ),
                  kSizedBoxH5,
                  DisplayCard(
                    DisplayText('Height', '180', labelSize: 60, unit: 'cm',),
                    DisplayActionSlider(),
                  ),
                  kSizedBoxH5,
                  Expanded(
                    child: Row(
                      children: [
                        DisplayCard(
                          DisplayText('Weight','60', unit: 'kg',),
                          DisplayActionButtons('Weight'),
                        ),
                        kSizedBoxW5,
                        DisplayCard(
                          DisplayText('Age','30',),
                          DisplayActionButtons('Age'),
                        ),
                      ],
                    ),
                  ),
                  kSizedBoxH5,
                  TextButton(
                    child: Text(
                      "Calculate BMI".toUpperCase(),
                      style: TextStyle(fontSize: 14)
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.white)
                        )
                      )
                    ),
                    onPressed: () {
                      final bloc = BlocProvider.of<BmiBloc>(context);
                      bloc.add(CalculateBmiEvent());
                      final AlertDialog alert = AlertDialog(
                        title: Text("Your BMI is"),
                        content: Text("${calculateBmi(bloc.state.weight, bloc.state.height).toStringAsFixed(2)}"),
                      );

                      // show the dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    }
                  ),
                  kSizedBoxH20,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  double calculateBmi(int weight, int height) {
    return weight / pow(height / 100, 2);
  }
}