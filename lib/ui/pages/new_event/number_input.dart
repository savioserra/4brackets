import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';
import 'package:provider/provider.dart';

class NumberInput extends StatefulWidget {
  final NumberInputController controller;

  const NumberInput({Key key, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  NumberInputController controller;

  @override
  void initState() {
    controller = widget.controller ?? NumberInputController();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        color: Colors.white,
        child: ChangeNotifierProvider.value(
          value: controller.valueNotifier,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Consumer<ValueNotifier<int>>(
                  builder: (ctx, notifier, child) => Text(notifier.value.toString()),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    buildButton(Icons.add, controller.increment),
                    Consumer<ValueNotifier<int>>(
                      builder: (ctx, notifier, child) => buildButton(
                        Icons.remove,
                        controller.decrement,
                        disabled: notifier.value == controller.minValue,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
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

class NumberInputController {
  final int incrementRate;
  final int minValue;

  ValueNotifier<int> valueNotifier;
  int get value => valueNotifier.value;

  NumberInputController({int minValue = 0, this.incrementRate = 1}) : minValue = minValue {
    valueNotifier = ValueNotifier(minValue);
  }

  void increment() {
    valueNotifier.value = max(valueNotifier.value * incrementRate, minValue);
  }

  void decrement() {
    valueNotifier.value = max(valueNotifier.value ~/ incrementRate, minValue);
  }

  dispose() {
    valueNotifier.dispose();
  }
}
