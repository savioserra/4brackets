import 'package:flutter/material.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';

class Input extends StatelessWidget {
  final String placeholderText;
  final bool multiline;
  final Function(String) onChanged;

  const Input({
    Key key,
    @required this.placeholderText,
    @required this.onChanged,
    this.multiline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: multiline ? 16.0 : 0.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [BoxShadow(blurRadius: 4.0, color: Colors.black12)],
      ),
      child: TextField(
        scrollPhysics: const BouncingScrollPhysics(),
        onChanged: onChanged,
        cursorColor: Palette.orange,
        minLines: multiline ? 4 : 1,
        maxLines: multiline ? 6 : 1,
        decoration: InputDecoration.collapsed(
          hintText: placeholderText,
        ),
      ),
    );
  }
}
