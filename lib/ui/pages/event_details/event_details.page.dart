import 'package:flutter/material.dart';
import 'package:graphql_mobx/core/models/event.dart';
import 'package:graphql_mobx/core/models/player.dart';
import 'package:graphql_mobx/injection.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';
import 'package:graphql_mobx/ui/widgets/brackets_app_bar.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class EventDetailsPage extends StatelessWidget {
  final Box<Player> playersBox;

  final String eventId;

  EventDetailsPage({Key key, @required this.eventId})
      : playersBox = Injection.get<Box<Player>>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Event>>(
      valueListenable: Injection.get<Box<Event>>().listenable(),
      builder: (ctx, snapshot, child) {
        var event = snapshot.get(eventId);

        return Scaffold(
          appBar: BracketsAppBar(title: "${event.name}'s Details"),
          backgroundColor: Palette.black,
          body: Center(
            child: Text(
              snapshot.get(eventId).id,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
