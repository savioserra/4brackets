import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String title;
  final Color color;

  const Label({Key key, this.title, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(color: color, fontSize: 12.0),
      ),
    );
  }
}
