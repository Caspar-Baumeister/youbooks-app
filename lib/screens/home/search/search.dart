import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/search/floating_search_bar.dart';

// holds the search functionallity and the Searchwidget
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBarWidget(onChange: (query) => searchOnChange(query));
  }

  void searchOnChange(String query) {
    BooksProvider booksProvider =
        Provider.of<BooksProvider>(context, listen: false);
    YoutuberProvider youtuberProvider =
        Provider.of<YoutuberProvider>(context, listen: false);
    searchForBook(query, booksProvider);
    searchForYoutuber(query, youtuberProvider);
  }

  void searchForBook(String query, BooksProvider booksProvider) {
    final books = booksProvider.books.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
    booksProvider.booksInSearch = books;
  }

  void searchForYoutuber(String query, YoutuberProvider youtuberProvider) {
    final youtuber = youtuberProvider.youtuber.where((yt) {
      final nameLower = yt.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return nameLower.contains(searchLower);
    }).toList();
    youtuberProvider.youtuberInSearch = youtuber;
  }
}
