import 'id.dart';

import 'package:hive/hive.dart';

part 'player.g.dart';

@HiveType(typeId: 1)
class Player extends HiveObject implements Id {
  @HiveField(0)
  String id;

  @HiveField(1)
  final String name;

  Player({this.name, this.id});
}
