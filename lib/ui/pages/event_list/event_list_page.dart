import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brackets/core/models/event.dart';
import 'package:brackets/core/models/player.dart';
import 'package:brackets/core/repositories/repository.dart';
import 'package:brackets/injection.dart';
import 'package:brackets/ui/pages/new_event/create_event_page.dart';
import 'package:brackets/ui/styles/palette.dart';
import 'package:brackets/ui/widgets/icon_button.dart' as CustomButtons;
import 'package:brackets/ui/widgets/brackets_app_bar.dart';
import 'package:brackets/ui/widgets/event_card.dart';
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
            itemBuilder: (ctx, idx) {
              var event = box.getAt(idx);

              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  overflow: Overflow.clip,
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        child: Container(color: Colors.red),
                      ),
                    ),
                    Dismissible(
                      key: Key(event.id),
                      child: EventCard(event: event),
                      onDismissed: (direction) => eventsBox.delete(event.id),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: CustomButtons.IconButton(
        size: 40.0,
        icon: Icon(Icons.add, size: 15.0, color: Colors.white),
        onTap: () => Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) => CreateEventPage())),
        color: Palette.purple,
        highlightColor: Palette.orange,
      ),
    );
  }
}
