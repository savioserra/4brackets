import 'id.dart';
import 'match.dart';

import 'package:hive/hive.dart';

part 'phase.g.dart';

@HiveType(typeId: 2)
class Phase extends HiveObject implements Id {
  @HiveField(0)
  String id;

  @HiveField(1)
  final int phaseOrder;

  @HiveField(2)
  final HiveList<Match> matches;

  Phase({this.id, this.phaseOrder, this.matches});
}
