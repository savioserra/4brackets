import 'package:get_it/get_it.dart';

import 'core/models/event.dart';
import 'core/models/player.dart';
import 'core/repositories/repository.dart';

class Injection {
  static GetIt get get => GetIt.instance;

  static void bootstrap() {
    get.registerLazySingleton<Repository<Player>>(
      () => Repository('players'),
    );

    get.registerLazySingleton<Repository<Event>>(
      () => Repository('events'),
    );
  }
}
