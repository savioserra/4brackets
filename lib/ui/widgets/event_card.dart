import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_mobx/core/models/event.dart';
import 'package:graphql_mobx/ui/pages/event_details/event_details.page.dart';
import 'package:graphql_mobx/ui/styles/icons.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';
import 'package:graphql_mobx/ui/widgets/icon_button.dart' as CustomIconButton;

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildCard(),
        buildFloatingButton(context),
      ],
    );
  }

  Widget buildFloatingButton(BuildContext context) {
    return Positioned(
      right: 15,
      top: 15,
      child: CustomIconButton.IconButton(
        size: 30.0,
        icon: Icon(Icons.chevron_right, color: Colors.white, size: 15.0),
        onTap: () => Navigator.of(context).push(CupertinoPageRoute(
          builder: (ctx) => EventDetailsPage(eventId: event.id),
        )),
      ),
    );
  }

  Widget buildCard() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: Column(
          children: [
            Column(
              children: [
                buildHeader(),
                buildBody(),
              ],
            ),
            buildFooter()
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Palette.orange],
        ),
      ),
      child: Row(
        textBaseline: TextBaseline.ideographic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(
              AwesomeIcons.trophy,
              size: 12.0,
            ),
          ),
          Text(
            event.name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          )
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Next Encounter: ",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 11.0,
            ),
          ),
          Text(
            "${event?.nextEncounter?.month}/${event?.nextEncounter?.day}/${event?.nextEncounter?.year}",
            style: TextStyle(fontSize: 11.0),
          )
        ],
      ),
    );
  }

  Widget buildBody() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                child: Text(
                  "Players:",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 13.0,
                  ),
                ),
              ),
              Text(event.totalPlayers.toString())
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      child: Text(
                        "Phase:",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                    Text("${event.currentPhase}/${event.totalPhases}")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
