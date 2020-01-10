import 'package:flutter/material.dart';
import 'package:graphql_mobx/core/models/event.dart';
import 'package:graphql_mobx/ui/pages/event_details/event_details.page.dart';
import 'package:graphql_mobx/ui/styles/icons.dart';
import 'package:graphql_mobx/ui/widgets/icon_button.dart' as CustomIconButton;

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _Card(event: event),
        _FloatingButton(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => EventDetailsPage(
                eventId: event.id,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FloatingButton extends StatelessWidget {
  final VoidCallback onTap;

  const _FloatingButton({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15,
      top: 15,
      child: CustomIconButton.IconButton(
        onTap: onTap,
        icon: Icon(
          Icons.chevron_right,
          color: Colors.white,
          size: 15.0,
        ),
        size: 30.0,
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key key, @required this.event}) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[300]),
        child: Column(
          children: [
            Column(
              children: [
                _Header(event: event),
                _Body(event: event),
              ],
            ),
            _Footer(
              event: event,
            )
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final Event event;

  const _Footer({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0.0, 12.0, 12.0, 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
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
}

class _Body extends StatelessWidget {
  final Event event;

  const _Body({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(6.0),
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
          Row(
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
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Event event;

  const _Header({Key key, @required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFB543), Colors.white],
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
}
