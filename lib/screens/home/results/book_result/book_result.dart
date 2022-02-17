import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/screens/home/results/book_result/widgets/book_filter.dart';
import 'package:youbooks_app/screens/home/results/book_result/widgets/book_similarity_list.dart';
import 'package:youbooks_app/screens/home/results/book_result/widgets/youtuber_list.dart';

class BookResult extends StatelessWidget {
  const BookResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    return Column(
      children: [
        const BookFilter(),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              YoutuberList(bookIds: booksProvider.selectedBookIds),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.red,
                ),
              ),
              BookSimilarityList(bookIds: booksProvider.selectedBookIds)
            ],
          ),
        )),
      ],
    );
  }
}
