import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musically/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Colors.black,
      child: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/spotify_logo.png',
                height: 50.0,
                filterQuality: FilterQuality.high,
              ),
            ),
          ]),
          SideMenuIconList("Home", Icons.home, () {}),
          SideMenuIconList("Search", Icons.search, () {}),
          SideMenuIconList("Radio", Icons.audiotrack, () {}),
          SizedBox(
            height: 10.0,
          ),
          _LibraryPlaylists(),
        ],
      ),
    );
  }
}

class SideMenuIconList extends StatelessWidget {
  String title;
  IconData iconname;
  VoidCallback onTap;
  SideMenuIconList(this.title, this.iconname, this.onTap);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[100],
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      leading: Icon(
        iconname,
        color: Colors.white,
        size: 24.0,
      ),
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  const _LibraryPlaylists({super.key});

  @override
  State<_LibraryPlaylists> createState() => __LibraryPlaylistsState();
}

class __LibraryPlaylistsState extends State<_LibraryPlaylists> {
  ScrollController? _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawScrollbar(
        thumbColor: Colors.grey[300],
        thickness: 8,
        radius: Radius.circular(20),
        isAlwaysShown: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Your Library",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                ...yourlibrary
                    .map((e) => ListTile(
                          dense: true,
                          title: Text(
                            e,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.grey[300],
                              letterSpacing: 1.0,
                            ),
                          ),
                          onTap: () {},
                        ))
                    .toList(),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Playlists",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[300],
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                ...playlists.map((e) => ListTile(
                      title: Text(
                        e,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[300],
                          letterSpacing: 1.0,
                        ),
                      ),
                      onTap: () {},
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
