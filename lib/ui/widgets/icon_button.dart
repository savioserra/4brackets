import 'package:flutter/material.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';

class IconButton extends StatelessWidget {
  final Icon icon;
  final double size;
  final VoidCallback onTap;
  final Color color;
  final Color splashColor;

  const IconButton({
    Key key,
    @required this.icon,
    @required this.size,
    @required this.onTap,
    this.color = Palette.orange,
    this.splashColor = Palette.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.orange,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(size)),
      ),
      child: InkWell(
        splashColor: Palette.black,
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(size)),
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: size,
          width: size,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: icon,
        ),
      ),
    );
  }
}