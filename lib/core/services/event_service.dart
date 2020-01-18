import 'package:hive/hive.dart';

import '../../injection.dart';
import '../models/event.dart';
import '../models/player.dart';
import '../repositories/repository.dart';

class EventService {
  final playersRepo = Injection.get<Repository<Player>>();
  final eventsRepo = Injection.get<Repository<Event>>();

  void attachPlayers(Event event, List<String> playersIds) {
    if (event.players == null) {
      event.players = HiveList<Player>(playersRepo.box);
    }

    var players = playersIds.map((id) => playersRepo.find(id));
    event.players.addAll(players);
  }
}
