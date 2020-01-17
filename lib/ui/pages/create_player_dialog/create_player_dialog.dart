import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:graphql_mobx/ui/pages/create_player_dialog/create_player_dialog_controller.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';
import 'package:graphql_mobx/ui/widgets/input.dart';
import 'package:graphql_mobx/ui/widgets/label.dart';

class CreatePlayerDialog extends StatefulWidget {
  @override
  _CreatePlayerDialogState createState() => _CreatePlayerDialogState();
}

class _CreatePlayerDialogState extends State<CreatePlayerDialog> {
  final controller = CreatePlayerDialogController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      // height: 200,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Label(title: "Name", color: Colors.black),
          Observer(
            builder: (ctx) => Input(
              placeholderText: "Eg. Jhon",
              onChanged: (s) => controller.playerName = s,
              border: Border.all(color: Colors.black38),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Observer(
                builder: (ctx) => FlatButton.icon(
                  color: Palette.blue,
                  disabledColor: Colors.grey,
                  splashColor: Palette.orange,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  icon: Icon(Icons.check, color: Colors.white),
                  label: Text("Create", style: const TextStyle(color: Colors.white)),
                  onPressed: controller.playerName.isEmpty ? null : controller.create,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
