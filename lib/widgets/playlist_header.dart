import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  PlaylistHeader(this.playlist);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PLAYLIST",
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    playlist.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    playlist.description,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Creator by ${playlist.creator}-${playlist.songs.length}songs,${playlist.duration}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        _PlaylistButtons(playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;
  _PlaylistButtons(this.followers);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "PLAY",
            style: TextStyle(color: Colors.white),
          ),
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 20.0),
              backgroundColor: Colors.green,
              textStyle: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(fontSize: 12, letterSpacing: 2),
              primary: Theme.of(context).iconTheme.color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
        ),
        SizedBox(
          width: 8.0,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border,
              size: 30,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              size: 30.0,
              color: Colors.white,
            )),
        const Spacer(),
        Text(
          'FOLLOWERS\n$followers',
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0,
          ),
        )
      ],
    );
  }
}
