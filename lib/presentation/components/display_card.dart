import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/presentation/components/constant.dart';

@immutable
class DisplayCard extends StatelessWidget {
  final Widget displayUnit;
  final Widget displayAction;
  final int flex;

  DisplayCard(this.displayUnit, this.displayAction, {this.flex = 1});

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
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 8,
      ),
      child: Container(
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Icon(icon),
        ),
      ),
    );
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
        //decoration: BoxDecoration(border: Border.all(color: Colors.red)),
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
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(unit),
                ],
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      )
    );
  }
}

@immutable
class DisplayActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: (){},
          //hoverColor: Colors.lightBlueAccent,
          icon: Icon(Icons.add),
        ),
        Spacer(),
        IconButton(
          onPressed: (){},
          //hoverColor: Colors.lightBlueAccent,
          icon: Icon(Icons.remove),
        ),
      ],
    );
  }
}

@immutable
class DisplayActionSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: 1,
      onChanged: (value) { print(value); },
    );
  }
}

