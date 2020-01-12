import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String title;

  const Label({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, bottom: 4.0),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 12.0),
      ),
    );
  }
}
