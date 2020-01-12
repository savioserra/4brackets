import 'package:flutter/material.dart';
import 'package:graphql_mobx/ui/styles/palette.dart';

class Input extends StatelessWidget {
  final String placeholderText;
  final TextEditingController controller;
  final bool multiline;

  const Input({Key key, @required this.placeholderText, this.controller, this.multiline = false})
      : super(key: key);

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
        controller: controller,
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
