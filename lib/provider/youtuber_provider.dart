import 'package:flutter/material.dart';

import 'package:youbooks_app/model/youtuber.dart';
import 'package:youbooks_app/services/database.dart';

class YoutuberProvider extends ChangeNotifier {
  List<Youtuber> _youtuber = [];
  List<Youtuber> _youtuberInSearch = [];
  List<Youtuber> _selectedYoutuber = [];

  bool initialized = false;

  List<Youtuber> get youtuber => _youtuber;
  List<Youtuber> get youtuberInSearch => _youtuberInSearch;
  List<Youtuber> get selectedYoutuber => _selectedYoutuber;

  YoutuberProvider() {
    loadData();
  }

  set youtuber(List<Youtuber> youtuber) {
    _youtuber = youtuber;
    notifyListeners();
  }

  set youtuberInSearch(List<Youtuber> youtuber) {
    _youtuberInSearch = youtuber;
    notifyListeners();
  }

  set selectedYoutuber(List<Youtuber> youtuber) {
    _selectedYoutuber = youtuber;
    notifyListeners();
  }

  // TODO so wie bei books id laden
  Future<void> loadData() async {
    final List<Object?> rawYoutuber = await DataBaseService().getAllYoutuber();
    _youtuber =
        List<Youtuber>.from(rawYoutuber.map((e) => Youtuber.fromJson(e)));
    _youtuberInSearch = _youtuber;
    initialized = true;
    notifyListeners();
  }

  void addYoutuber(Youtuber youtuber) {
    if (_selectedYoutuber.contains(youtuber)) return;
    _selectedYoutuber.add(youtuber);
    notifyListeners();
  }

  void removeFromSelection(Youtuber youtuber) {
    if (!_selectedYoutuber.contains(youtuber)) return;
    _selectedYoutuber.remove(youtuber);
    notifyListeners();
  }
}
