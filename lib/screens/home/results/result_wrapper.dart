import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/screens/home/results/book_result/book_result.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/youtuber_result.dart';

// returns either the book result if a book was selected
// or a youtuber result if an youtuber was collected
class ResultWrapper extends StatelessWidget {
  const ResultWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);

    return booksProvider.selectedBookIds.isEmpty
        ? const YoutuberResult()
        : const BookResult();
  }
}
