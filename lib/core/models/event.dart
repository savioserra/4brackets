import 'package:uuid/uuid.dart';
import 'package:graphql_mobx/core/models/player.dart';
import 'package:hive/hive.dart';
import 'dart:math' as math;

part 'event.g.dart';

@HiveType(typeId: 1)
class Event extends HiveObject {
  @HiveField(1)
  final String id;

  @HiveField(0)
  final String name;

  @HiveField(2)
  final DateTime nextEncounter;

  @HiveField(3)
  final int currentPhase;

  @HiveField(4)
  final HiveList<Player> players;

  int get totalPlayers {
    print(players?.length ?? 0);
    return players?.length ?? 0;
  }

  int get totalPhases {
    if (players == null || players.isEmpty) return 0;
    return math.log(totalPlayers) ~/ math.log(2);
  }

  Event({
    this.nextEncounter,
    this.name,
    this.players,
    this.currentPhase = 1,
  }) : id = Uuid().v4();
}
