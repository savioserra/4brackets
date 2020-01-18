import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/event.dart';
import '../../../core/models/player.dart';
import '../../../core/repositories/repository.dart';
import '../../../core/services/event_service.dart';
import '../../../core/services/navigation_service.dart';
import '../../../injection.dart';
import '../../../injection.dart';
import '../event_list/event_list_page.dart';

part 'add_players_page_controller.g.dart';

abstract class _AddPlayersPageController with Store {
  final playersRepo = Injection.get<Repository<Player>>();
  final eventsRepo = Injection.get<Repository<Event>>();
  final eventsService = Injection.get<EventService>();

  final ObservableList<String> selectedPlayers = ObservableList.of([]);
  final Event event;
  final int maxPlayersCount;

  _AddPlayersPageController({this.maxPlayersCount, this.event});

  ValueListenable<Box<Player>> get availablePlayers {
    return playersRepo.watch();
  }

  @action
  void addPlayer(String playerId) {
    if (selectedPlayers.length < maxPlayersCount) selectedPlayers.add(playerId);
  }

  @action
  void removePlayer(String playerId) {
    selectedPlayers.remove(playerId);
  }

  void create() {
    eventsService.attachPlayers(event, selectedPlayers);
    eventsRepo.create(event);

    Injection.get<NavigationService>().pushReplacement((ctx) => EventListPage());
  }
}

class AddPlayersPageController = _AddPlayersPageController with _$AddPlayersPageController;
