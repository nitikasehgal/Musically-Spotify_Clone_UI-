import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musically/model/current_song.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(children: [
          _TrackInfo(),
          Spacer(),
          _PlayerControls(),
          Spacer(),
          if (MediaQuery.of(context).size.width > 800) _MoreControls(),
        ]),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentSong>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofi-girl.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 12.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              selected.artist,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12.0,
                  letterSpacing: 1),
            )
          ],
        ),
        const SizedBox(width: 12.0),
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentSong>().selected;
    return Column(children: [
      Row(
        children: [
          IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              onPressed: () {},
              icon: Icon(
                Icons.shuffle,
                color: Colors.white,
              )),
          IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              onPressed: () {},
              icon: Icon(
                Icons.skip_previous_outlined,
                color: Colors.white,
              )),
          IconButton(
              padding: EdgeInsets.only(),
              iconSize: 34.0,
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_fill_outlined,
                color: Colors.white,
              )),
          IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              onPressed: () {},
              icon: Icon(
                Icons.skip_next_outlined,
                color: Colors.white,
              )),
          IconButton(
              padding: EdgeInsets.only(),
              iconSize: 20.0,
              onPressed: () {},
              icon: Icon(
                Icons.repeat,
                color: Colors.white,
              )),
        ],
      ),
      SizedBox(
        height: 4.0,
      ),
      Row(
        children: [
          Text(
            "0.00",
            style: TextStyle(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.caption!.fontSize),
          ),
          SizedBox(
            width: 8.0,
          ),
          Container(
            height: 5.0,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5)),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            selected?.duration ?? '0:00',
            style: TextStyle(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.caption!.fontSize),
          )
        ],
      )
    ]);
  }
}

class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.devices_outlined,
              color: Colors.white,
              size: 20.0,
            )),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.volume_up_outlined,
                  color: Colors.white,
                  size: 20.0,
                )),
            Container(
                height: 5.0,
                width: 70.0,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(2.5)))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.fullscreen_outlined,
              color: Colors.white,
              // size: 20.0,
            )),
      ],
    );
  }
}
