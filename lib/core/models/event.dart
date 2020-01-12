import 'id.dart';
import 'phase.dart';
import 'player.dart';

import 'package:hive/hive.dart';
import 'dart:math' as math;

part 'event.g.dart';

@HiveType(typeId: 0)
class Event extends HiveObject implements Id {
  @HiveField(0)
  String id;

  @HiveField(1)
  final String name;

  @HiveField(6)
  final String description;

  @HiveField(2)
  final DateTime nextEncounter;

  @HiveField(3)
  final int currentPhase;

  @HiveField(4)
  final HiveList<Player> players;

  @HiveField(5)
  final HiveList<Phase> phases;

  int get totalPlayers {
    return players?.length ?? 0;
  }

  int get totalPhases {
    if (players == null || players.isEmpty) return 0;
    return math.log(totalPlayers) ~/ math.log(2);
  }

  Event({
    this.id,
    this.nextEncounter,
    this.name,
    this.players,
    this.phases,
    this.description,
    this.currentPhase = 1,
  });
}
