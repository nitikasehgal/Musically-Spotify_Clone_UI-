import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musically/data.dart';
import 'package:musically/widgets/track_list.dart';

import '../widgets/playlist_header.dart';

class PlayListScreen extends StatefulWidget {
  final Playlist playlist;
  PlayListScreen(this.playlist);

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen> {
  ScrollController? _scrollcontroller;
  @override
  void initState() {
    _scrollcontroller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollcontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_left,
                    size: 28.0,
                  ),
                ),
              ),
              SizedBox(
                width: 16.0,
              ),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      color: Colors.black26, shape: BoxShape.circle),
                  child: Icon(
                    Icons.chevron_right,
                    size: 28.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
                size: 30.0,
              ),
              label: Text(
                "Nitika NS",
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            width: 8.0,
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_down,
                size: 30.0,
              )),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFAF1018), Colors.black],
                stops: [0, 0.3])),
        child: RawScrollbar(
            thumbColor: Colors.grey[300],
            // thickness: 5,
            isAlwaysShown: true,
            controller: _scrollcontroller,
            child: ListView(
              controller: _scrollcontroller,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
              children: [
                PlaylistHeader(widget.playlist),
                TrackList(widget.playlist.songs),
              ],
            )),
      ),
    );
  }
}
