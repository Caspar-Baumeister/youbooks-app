import 'package:flutter/material.dart';

import 'package:youbooks_app/model/books.dart';
import 'package:youbooks_app/services/database.dart';

class BooksProvider extends ChangeNotifier {
  // all books
  List<Book> _books = [];
  // books shown in the search
  List<Book> _booksInSearch = [];
  // books selected in the search
  List<String> _selectedBookIds = [];

  bool initialized = false;

  List<Book> get books => _books;
  List<Book> get booksInSearch => _booksInSearch;
  List<String> get selectedBookIds => _selectedBookIds;

  Book getBookByID(bookId) {
    return _books.firstWhere((element) => element.id == bookId);
  }

  BooksProvider() {
    loadData();
  }

  set books(List<Book> books) {
    _books = books;
    notifyListeners();
  }

  set booksInSearch(List<Book> books) {
    _booksInSearch = books;
    notifyListeners();
  }

  set selectedBookIds(List<String> bookIds) {
    _selectedBookIds = bookIds;
    notifyListeners();
  }

  Future<void> loadData() async {
    final List<Map<String, dynamic>> rawBooks =
        await DataBaseService().getAllBook();

    _books =
        List<Book>.from(rawBooks.map((e) => Book.fromJson(e["id"], e["data"])));
    _booksInSearch = _books;
    initialized = true;
    notifyListeners();
  }

  void addBook(String bookId) {
    if (_selectedBookIds.contains(bookId)) return;
    _selectedBookIds.add(bookId);
    notifyListeners();
  }

  void removeFromSelection(String bookId) {
    if (!_selectedBookIds.contains(bookId)) return;
    _selectedBookIds.remove(bookId);
    notifyListeners();
  }
}
