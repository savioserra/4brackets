import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_mobx/ui/widgets/brackets_app_bar.dart';
import 'input.dart';
import 'label.dart';
import 'number_input.dart';

class CreateEventPage extends StatefulWidget {
  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  final NumberInputController playersController = NumberInputController(incrementRate: 2, minValue: 2);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BracketsAppBar(
        title: "Create Event",
        rightAction: GestureDetector(
          onTap: () {},
          child: Text(
            "Next",
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(title: "Name"),
        Input(placeholderText: "Eg. An Awesome Event"),
        separator(),
        Label(title: "Description"),
        Input(placeholderText: "Eg. Welcome...", multiline: true),
        separator(),
        Label(title: "Number of Players"),
        NumberInput(controller: playersController),
      ],
    );
  }

  Widget separator() => const SizedBox(height: 16.0);
}
