import 'id.dart';
import 'player.dart';

import 'package:hive/hive.dart';

part 'match.g.dart';

@HiveType(typeId: 3)
class Match extends HiveObject implements Id {
  @HiveField(0)
  String id;

  @HiveField(2)
  final HiveList<Player> players;

  Match({this.id, this.players});
}
