import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:graphql_mobx/ui/pages/new_event/create_event_controller.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';
import 'package:graphql_mobx/ui/widgets/brackets_app_bar.dart';
import 'input.dart';
import 'label.dart';
import 'number_input.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final controller = CreateEventPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: BracketsAppBar(
        title: "Create Event",
        rightAction: Observer(
          builder: (ctx) => GestureDetector(
            onTap: controller.isValid ? controller.toNextStep : null,
            child: TweenAnimationBuilder<Color>(
              duration: const Duration(milliseconds: 200),
              tween: ColorTween(
                  begin: Palette.purple, end: controller.isValid ? Palette.blue : Colors.grey[300]),
              builder: (ctx, color, child) => Text(
                "Next",
                style: TextStyle(fontSize: 16, color: color),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
          child: Column(
            children: [
              buildGeneralInfoSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGeneralInfoSection() {
    return Observer(
      builder: (ctx) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(title: "Name"),
          Input(
            placeholderText: "Eg. An Awesome Event",
            onChanged: (v) => controller.eventName = v,
          ),
          separator(),
          Label(title: "Description"),
          Input(
            placeholderText: "Eg. Welcome...",
            multiline: true,
            onChanged: (v) => controller.eventDescription = v,
          ),
          separator(),
          Label(title: "Number of Players"),
          NumberInput(
            value: controller.eventNumberOfPlayers,
            minValue: 2,
            maxValue: 64,
            onIncrement: controller.incrementNumberOfPlayers,
            onDecrement: controller.decrementNumberOfPlayers,
          ),
        ],
      ),
    );
  }

  Widget separator() => const SizedBox(height: 16.0);
}
