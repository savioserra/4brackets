import 'package:flutter/material.dart';
import 'package:graphql_mobx/core/services/navigation_service.dart';
import 'package:graphql_mobx/hive.dart';
import 'package:graphql_mobx/injection.dart';
import 'package:graphql_mobx/ui/pages/event_list/event_list_page.dart';

Future<void> main() async {
  await hiveBootstrap();
  Injection.bootstrap();

  runApp(BracketsApp());
}

class BracketsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Injection.get<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: EventListPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Biko",
      ),
    );
  }
}
