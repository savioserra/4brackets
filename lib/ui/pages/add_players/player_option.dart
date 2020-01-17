import 'package:flutter/material.dart';
import 'package:graphql_mobx/core/models/player.dart';

class PlayerOption extends StatelessWidget {
  final Player player;
  final bool selected;

  const PlayerOption({Key key, @required this.player, this.selected = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: selected ? Colors.grey : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      height: 50.0,
      child: Text(player.name),
    );
    // Material(
    //   color: Colors.red,
    //   child: InkWell(
    //     onTap: () {},
    //   ),
    // )
  }
}
