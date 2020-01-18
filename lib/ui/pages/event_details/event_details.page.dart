import 'package:flutter/material.dart';
import 'package:brackets/core/models/event.dart';
import 'package:brackets/core/models/player.dart';
import 'package:brackets/core/repositories/repository.dart';
import 'package:brackets/injection.dart';
import 'package:brackets/ui/styles/palette.dart';
import 'package:brackets/ui/widgets/brackets_app_bar.dart';
import 'package:hive/hive.dart';

class EventDetailsPage extends StatelessWidget {
  final Repository<Player> playersBox;

  final String eventId;

  EventDetailsPage({Key key, @required this.eventId})
      : playersBox = Injection.get<Repository<Player>>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Event>>(
      valueListenable: Injection.get<Repository<Event>>().watch(keys: [eventId]),
      builder: (ctx, snapshot, child) {
        var event = snapshot.get(eventId);

        return Scaffold(
          appBar: BracketsAppBar(title: "${event.name}'s Details"),
          backgroundColor: Palette.black,
          body: Center(
            child: Text(
              snapshot.get(eventId).description,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
