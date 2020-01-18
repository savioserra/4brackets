import 'package:flutter/material.dart';
import 'package:brackets/ui/styles/palette.dart';

class IconButton extends StatelessWidget {
  final Icon icon;
  final double size;
  final VoidCallback onTap;
  final Color color;
  final Color splashColor;
  final Color highlightColor;

  const IconButton({
    Key key,
    @required this.icon,
    @required this.size,
    @required this.onTap,
    this.color = Palette.orange,
    this.splashColor = Colors.transparent,
    this.highlightColor = Palette.purple,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(size)),
      ),
      child: InkWell(
        splashColor: splashColor,
        highlightColor: highlightColor,
        borderRadius: BorderRadius.all(Radius.circular(size)),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: size,
          width: size,
          decoration: BoxDecoration(shape: BoxShape.circle),
          child: icon,
        ),
      ),
    );
  }
}
