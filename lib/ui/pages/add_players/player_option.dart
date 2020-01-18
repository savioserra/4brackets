import 'package:flutter/material.dart';
import 'package:brackets/core/models/player.dart';

import '../../styles/palette.dart';

class PlayerOption extends StatelessWidget {
  final Player player;
  final bool selected;
  final VoidCallback onTap;

  const PlayerOption({Key key, @required this.player, this.selected = false, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Palette.orange,
        borderRadius: borderRadius,
        onTap: onTap,
        child: AnimatedContainer(
          height: 50.0,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: selected ? Palette.orange : Colors.white24,
            borderRadius: borderRadius,
          ),
          child: Text(player.name, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  static const borderRadius = BorderRadius.all(Radius.circular(8.0));
}
