import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bmi_app/application/bmi_bloc.dart';
import 'package:flutter_bmi_app/presentation/components/constant.dart';

@immutable
class DisplayCard extends StatelessWidget {
  final Widget displayUnit;
  final Widget displayAction;
  //final BmiEvent event;
  final int flex;

  DisplayCard(this.displayUnit,
      this.displayAction,
      //this.event,
      {this.flex = 1});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 9,
                  child: displayUnit,
                ),
                (displayUnit is DisplayText)
                    ? Expanded(
                      flex: 2,
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: displayAction
                      ),
                    )
                    : Container(),
                kSizedBoxH5
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class DisplayIcon extends StatelessWidget {
  final IconData icon;

  DisplayIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiBloc, BmiState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<BmiBloc>(context);
        return InkWell(
          onTap: () {
            icon == Icons.male
                ? bloc.add(ChooseGenderEvent(1))
                : bloc.add(ChooseGenderEvent(0));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 8,
            ),
            child: Container(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Icon(
                  icon,
                  color: getColor(icon, state.highlightGender),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Color getColor(IconData icon, int gender) {
    Color color = Colors.white;
    if (icon == Icons.male) {
      if (gender == 1) { color = Colors.lightBlueAccent; }
    } else {
      if (gender == 0) { color = Colors.lightBlueAccent; }
    }
    return color;
  }
}

@immutable
class DisplayText extends StatelessWidget {
  final String label;
  final double labelSize;
  final String text;
  final String unit;

  DisplayText(this.label, this.text, {this.labelSize = 40, this.unit = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: labelSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  BlocBuilder<BmiBloc, BmiState>(
                    builder: (context, state) {
                      return Text(
                        getData(label, state),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  Text(unit),
                ],
              ),
            ),
            kSizedBoxH20,
          ],
        ),
      )
    );
  }

  String getData(String label, BmiState state) {
    if (label == 'Height') {
      return state.height.toString();
    } else if (label == 'Weight') {
      return state.weight.toString();
    } else {
      return state.age.toString();
    }
  }
}

@immutable
class DisplayActionButtons extends StatelessWidget {
  final String data;

  DisplayActionButtons(this.data);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BmiBloc>(context);
    return BlocBuilder<BmiBloc, BmiState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                data == 'Age'
                    ? bloc.add(ChooseAgeIncrementEvent())
                    : bloc.add(ChooseWeightIncrementEvent());
              },
              icon: Icon(Icons.add),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                data == 'Age'
                    ? bloc.add(ChooseAgeDecrementEvent())
                    : bloc.add(ChooseWeightDecrementEvent());
              },
              icon: Icon(Icons.remove),
            ),
          ],
        );
      },
    );
  }
}

@immutable
class DisplayActionSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BmiBloc>(context);
    return Slider(
      value: bloc.state.height.toDouble(),
      min: 60,
      max: 240,
      onChanged: (value) {
        bloc.add(ChooseHeightEvent(value.toInt()));
      },
    );
  }
}

