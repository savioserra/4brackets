import 'package:flutter/material.dart';
import 'package:graphql_mobx/core/models/event.dart';
import 'package:graphql_mobx/core/models/player.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await getApplicationDocumentsDirectory()).path);
}

void registerAdapters() {
  Hive.registerAdapter(PlayerAdapter());
  Hive.registerAdapter(EventAdapter());
}

Future<void> openBoxes() async {
  await Future.wait([
    Hive.openBox<Player>("players"),
    Hive.openBox<Event>("events"),
  ]);
}

Future<void> hiveBootstrap() async {
  await initialize();

  registerAdapters();
  await openBoxes();
}
