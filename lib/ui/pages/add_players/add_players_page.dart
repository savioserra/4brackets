import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:brackets/core/models/event.dart';
import 'package:brackets/core/models/player.dart';
import 'package:brackets/core/repositories/repository.dart';
import 'package:brackets/injection.dart';
import 'package:brackets/ui/pages/add_players/add_players_page_controller.dart';
import 'package:brackets/ui/styles/palette.dart';
import 'package:brackets/ui/widgets/brackets_app_bar.dart';
import 'package:brackets/ui/widgets/icon_button.dart' as CustomButtons;
import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/player.dart';
import '../create_player_dialog/create_player_dialog.dart';
import 'player_option.dart';

class AddPlayersPage extends StatefulWidget {
  final Event event;
  final int maxPlayersCount;

  AddPlayersPage({Key key, this.event, @required this.maxPlayersCount}) : super(key: key);

  @override
  _AddPlayersPageState createState() => _AddPlayersPageState();
}

class _AddPlayersPageState extends State<AddPlayersPage> {
  AddPlayersPageController controller;
  ReactionDisposer disposer;

  @override
  void initState() {
    controller = AddPlayersPageController(event: widget.event, maxPlayersCount: widget.maxPlayersCount);

    super.initState();
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (disposer != null) disposer();

    disposer = reaction<int>(
      (r) => controller.selectedPlayers.length,
      (l) => Flushbar(
        flushbarStyle: FlushbarStyle.FLOATING,
        borderRadius: 8.0,
        margin: const EdgeInsets.all(16.0),
        duration: const Duration(seconds: 2),
        messageText: Text("$l / ${widget.maxPlayersCount}", style: const TextStyle(color: Colors.white)),
        animationDuration: const Duration(milliseconds: 100),
      ).show(context),
    );

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BracketsAppBar(
        title: "Add Players",
        rightAction: GestureDetector(
          child: Text("Create", style: TextStyle(fontSize: 16)),
          onTap: controller.create,
        ),
      ),
      backgroundColor: Colors.grey[900],
      floatingActionButton: CustomButtons.IconButton(
        size: 40.0,
        onTap: () => showDialog(
          context: context,
          child: SimpleDialog(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            children: [CreatePlayerDialog()],
          ),
        ),
        color: Palette.purple,
        highlightColor: Palette.orange,
        icon: Icon(Icons.add, size: 15.0, color: Colors.white),
      ),
      body: Stack(
        children: [
          ValueListenableBuilder<Box<Player>>(
            valueListenable: controller.availablePlayers,
            builder: (ctx, snapshot, child) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                itemCount: snapshot.length,
                itemBuilder: (ctx, idx) => Observer(
                  builder: (ctx) {
                    var player = snapshot.getAt(idx);
                    var isSelected = controller.selectedPlayers.contains(player.id);

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: PlayerOption(
                        player: player,
                        selected: isSelected,
                        onTap: isSelected
                            ? () => controller.removePlayer(player.id)
                            : () => controller.addPlayer(player.id),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
