import 'package:flutter/material.dart';
import 'package:graphql_mobx/hive.dart';
import 'package:graphql_mobx/injection.dart';
import 'package:graphql_mobx/ui/pages/event_list/event_list.page.dart';

Future<void> main() async {
  await hiveBootstrap();
  Injection.bootstrap();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Biko",
      ),
      home: EventListPage(),
    );
  }
}
