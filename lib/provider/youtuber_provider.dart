import 'package:flutter/material.dart';

import 'package:youbooks_app/model/youtuber.dart';
import 'package:youbooks_app/services/database.dart';

class YoutuberProvider extends ChangeNotifier {
  List<Youtuber> _youtuber = [];
  bool initialized = false;

  List<Youtuber> get youtuber => _youtuber;

  youtuberProvider() {
    loadData();
  }

  set youtuber(List<Youtuber> youtuber) {
    _youtuber = youtuber;
    notifyListeners();
  }

  Future<void> loadData() async {
    final List<Object?> rawYoutuber = await DataBaseService().getAllYoutuber();
    youtuber =
        List<Youtuber>.from(rawYoutuber.map((e) => Youtuber.fromJson(e)));
    initialized = true;
    notifyListeners();
  }
}
