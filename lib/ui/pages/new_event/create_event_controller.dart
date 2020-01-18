import 'package:brackets/core/models/event.dart';
import 'package:brackets/core/services/navigation_service.dart';
import 'package:brackets/injection.dart';
import 'package:brackets/ui/pages/add_players/add_players_page.dart';
import 'package:mobx/mobx.dart';

part 'create_event_controller.g.dart';

class CreateEventPageController = _CreatePageControllerBase with _$CreateEventPageController;

abstract class _CreatePageControllerBase with Store {
  @observable
  String eventName = '';

  @observable
  String eventDescription = '';

  @observable
  int _eventNumberOfPlayers = 2;

  @computed
  bool get isValid {
    return eventName.isNotEmpty && eventDescription.isNotEmpty;
  }

  int get eventNumberOfPlayers {
    return _eventNumberOfPlayers;
  }

  @action
  void incrementNumberOfPlayers() {
    _eventNumberOfPlayers *= 2;
  }

  @action
  void decrementNumberOfPlayers() {
    _eventNumberOfPlayers ~/= 2;
  }

  void toNextStep() {
    Injection.get<NavigationService>().push(
      (ctx) => AddPlayersPage(
        maxPlayersCount: _eventNumberOfPlayers,
        event: Event(
          description: eventDescription,
          name: eventName,
        ),
      ),
    );
  }
}
