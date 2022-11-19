import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:musically/data.dart';
import 'package:musically/model/current_song.dart';
import 'package:provider/provider.dart';

class TrackList extends StatelessWidget {
  final List<Song> tracks;
  TrackList(this.tracks);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        headingTextStyle:
            Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
        showCheckboxColumn: false,
        dataRowHeight: 54.0,
        columns: [
          DataColumn(
              label: Text(
            "TITLE",
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            "ARTIST",
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
              label: Text(
            "ALBUM",
            style: TextStyle(color: Colors.white),
          )),
          DataColumn(
            label: Icon(Icons.access_time, color: Colors.white),
          ),
        ],
        rows: tracks.map((e) {
          final selected = context.watch<CurrentSong>().selected?.id == e.id;
          final textStyle = selected
              ? TextStyle(color: Colors.green)
              : TextStyle(color: Colors.white);
          return DataRow(
              cells: [
                DataCell(Text(
                  e.title,
                  style: textStyle,
                )),
                DataCell(Text(
                  e.artist,
                  style: textStyle,
                )),
                DataCell(Text(
                  e.album,
                  style: textStyle,
                )),
                DataCell(Text(
                  e.duration,
                  style: textStyle,
                )),
              ],
              selected: selected,
              onSelectChanged: (_) {
                context.read<CurrentSong>().selectedsong(e);
              });
        }).toList());
  }
}
