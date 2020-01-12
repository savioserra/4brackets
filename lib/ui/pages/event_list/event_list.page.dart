import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_mobx/core/models/event.dart';
import 'package:graphql_mobx/core/models/player.dart';
import 'package:graphql_mobx/core/repositories/repository.dart';
import 'package:graphql_mobx/injection.dart';
import 'package:graphql_mobx/ui/pages/new_event/create_event_page.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';
import 'package:graphql_mobx/ui/widgets/icon_button.dart' as CustomButtons;
import 'package:graphql_mobx/ui/widgets/brackets_app_bar.dart';
import 'package:graphql_mobx/ui/widgets/event_card.dart';
import 'package:hive/hive.dart';

class EventListPage extends StatelessWidget {
  final Repository<Event> eventsBox;
  final Repository<Player> playersBox;

  EventListPage({Key key})
      : eventsBox = Injection.get<Repository<Event>>(),
        playersBox = Injection.get<Repository<Player>>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: BracketsAppBar(title: "Events", backButton: false),
      body: ValueListenableBuilder<Box<Event>>(
        valueListenable: eventsBox.watch(),
        builder: (ctx, box, child) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            physics: const BouncingScrollPhysics(),
            itemCount: box.length,
            itemBuilder: (ctx, idx) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: EventCard(event: box.getAt(idx)),
            ),
          );
        },
      ),
      floatingActionButton: CustomButtons.IconButton(
        size: 30.0,
        icon: Icon(Icons.add, size: 15.0, color: Colors.white),
        onTap: () => Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) => CreateEventPage())),
        color: Palette.purple,
      ),
    );
  }
}
