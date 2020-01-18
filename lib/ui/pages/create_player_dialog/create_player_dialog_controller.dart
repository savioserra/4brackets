import 'package:brackets/core/models/player.dart';
import 'package:brackets/core/repositories/repository.dart';
import 'package:brackets/core/services/navigation_service.dart';
import 'package:brackets/injection.dart';
import 'package:mobx/mobx.dart';

part 'create_player_dialog_controller.g.dart';

abstract class _CreatePlayerDialogController with Store {
  final playersRepo = Injection.get<Repository<Player>>();

  @observable
  String playerName = '';

  void create() async {
    await playersRepo.create(Player(name: playerName));
    Injection.get<NavigationService>().back();
  }
}

class CreatePlayerDialogController = _CreatePlayerDialogController with _$CreatePlayerDialogController;
