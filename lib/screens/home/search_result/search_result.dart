import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/services/database.dart';

// decides if the youtuber result and bookcomparesen is shown or vice versa
class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    DataBaseService service = DataBaseService();

    return Container(
      decoration: BoxDecoration(color: Colors.grey),
    );
  }
}
