import 'package:flutter/material.dart';
import 'package:graphql_mobx/core/models/event.dart';
import 'package:graphql_mobx/core/models/player.dart';
import 'package:graphql_mobx/core/repositories/repository.dart';
import 'package:graphql_mobx/injection.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';
import 'package:graphql_mobx/ui/widgets/brackets_app_bar.dart';
import 'package:graphql_mobx/ui/widgets/icon_button.dart' as CustomButtons;

class AddPlayersPage extends StatelessWidget {
  final Event event;
  final playersRepo = Injection.get<Repository<Player>>();

  AddPlayersPage({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BracketsAppBar(title: "Add Players"),
      backgroundColor: Colors.grey[900],
      floatingActionButton: CustomButtons.IconButton(
        size: 40.0,
        onTap: () => {},
        color: Palette.purple,
        highlightColor: Palette.orange,
        icon: Icon(Icons.add, size: 15.0, color: Colors.white),
      ),
      body: Container(
        child: Text(event.name, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
