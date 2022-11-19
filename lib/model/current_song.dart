import 'package:flutter/cupertino.dart';
import 'package:musically/data.dart';

class CurrentSong extends ChangeNotifier {
  Song? selected;

  void selectedsong(Song track) {
    selected = track;
    notifyListeners();
  }
}
