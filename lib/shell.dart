import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musically/data.dart';
import 'package:musically/screens/playlist_screen.dart';
import 'package:musically/widgets/current_track.dart';
import 'package:musically/widgets/side_menu.dart';

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                if (MediaQuery.of(context).size.width > 800) SideMenu(),
                Expanded(child: PlayListScreen(lofihiphopPlaylist)),
              ],
            ),
          ),
          const CurrentTrack(),
        ],
      ),
    );
  }
}
