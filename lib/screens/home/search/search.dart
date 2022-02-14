import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/books.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/search/floating_search_bar.dart';
import 'package:youbooks_app/screens/home/search_result/search_result.dart';

// holds the search functionallity and the Searchwidget
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";
  List<Book> books = [];
  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);

    return Stack(
      fit: StackFit.expand,
      children: const [
        SearchResult(),
        FloatingSearchBarWidget(),
      ],
    );
  }

  void searchForBook(String query, List<Book> allBooks) {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.books = books;
    });
  }
}
