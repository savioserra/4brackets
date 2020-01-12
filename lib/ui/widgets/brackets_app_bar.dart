import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_mobx/ui/styles/icons.dart';

class BracketsAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool backButton;
  final Widget rightAction;

  BracketsAppBar({Key key, this.title, this.backButton = true, this.rightAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: SafeArea(
          child: Row(
            textBaseline: TextBaseline.ideographic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              if (backButton)
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(AwesomeIcons.chevronLeft, size: 12.0),
                  ),
                ),
              Expanded(
                child: Row(
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              if (rightAction != null) rightAction,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100.0);
}
