import 'package:get_it/get_it.dart';
import 'package:graphql_mobx/core/models/event.dart';
import 'package:graphql_mobx/core/models/player.dart';
import 'package:hive/hive.dart';

class Injection {
  static GetIt get get => GetIt.instance;

  static void bootstrap() {
    get.registerLazySingleton<Box<Player>>(() => Hive.box('players'));
    get.registerLazySingleton<Box<Event>>(() => Hive.box('events'));
  }
}
