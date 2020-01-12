import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_mobx/core/models/event.dart';
import 'package:graphql_mobx/core/models/player.dart';
import 'package:graphql_mobx/core/repositories/repository.dart';
import 'package:graphql_mobx/injection.dart';
import 'package:graphql_mobx/ui/widgets/icon_button.dart' as CustomButtons;
import 'package:graphql_mobx/ui/styles/palette.dart';
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
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        floatingActionButton: CustomButtons.IconButton(
          size: 30.0,
          icon: Icon(Icons.add, size: 15.0),
          onTap: () {
            eventsBox.create(
              Event(
                nextEncounter: DateTime.now(),
                name: "Test",
              ),
            );
          },
        ),
        backgroundColor: Palette.black,
        appBar: BracketsAppBar(title: "Eventos"),
        body: ValueListenableBuilder<Box<Event>>(
          valueListenable: eventsBox.watch(),
          builder: (ctx, box, child) {
            return Container(
              alignment: Alignment.center,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                physics: const BouncingScrollPhysics(),
                itemCount: box.length,
                itemBuilder: (ctx, idx) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: EventCard(event: box.getAt(idx)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
