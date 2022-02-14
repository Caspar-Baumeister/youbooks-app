import 'package:flutter/material.dart';

import 'package:youbooks_app/model/books.dart';
import 'package:youbooks_app/services/database.dart';

class BooksProvider extends ChangeNotifier {
  List<Book> _books = [];
  bool initialized = false;

  List<Book> get books => _books;

  BooksProvider() {
    loadData();
  }

  set books(List<Book> books) {
    _books = books;
    notifyListeners();
  }

  Future<void> loadData() async {
    final List<Object?> rawBooks = await DataBaseService().getAllBook();
    books = List<Book>.from(rawBooks.map((e) => Book.fromJson(e)));
    initialized = true;
    notifyListeners();
  }
}
