import 'package:flutter/material.dart';
import 'package:brackets/ui/styles/palette.dart';

class NumberInput extends StatelessWidget {
  final int value;
  final int minValue;
  final int maxValue;

  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const NumberInput({
    Key key,
    @required this.value,
    this.onDecrement,
    this.onIncrement,
    @required this.minValue,
    @required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(value.toString()),
            ),
            Container(
              child: Row(
                children: [
                  buildButton(Icons.add, onIncrement, disabled: value >= maxValue),
                  buildButton(Icons.remove, onDecrement, disabled: value <= minValue),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(IconData iconData, VoidCallback onTap, {bool disabled = false}) {
    return TweenAnimationBuilder<Color>(
      duration: const Duration(milliseconds: 120),
      tween: ColorTween(
        begin: Palette.purple,
        end: disabled ? Colors.grey : Palette.purple,
      ),
      child: InkWell(
        highlightColor: Palette.orange,
        splashColor: Colors.transparent,
        onTap: disabled ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
          child: Icon(iconData, size: 16.0, color: Colors.white),
        ),
      ),
      builder: (ctx, color, child) => Material(
        color: color,
        child: child,
      ),
    );
  }
}
