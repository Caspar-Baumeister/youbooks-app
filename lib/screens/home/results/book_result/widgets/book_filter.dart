import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/books.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/screens/home/results/book_result/widgets/book_filter_card.dart';

class BookFilter extends StatelessWidget {
  const BookFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    // dont show filter if type is all and no category is selected
    return booksProvider.selectedBookIds.isNotEmpty
        ? Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Text(
                    "Your books:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  // show type if type is not all
                  ...booksProvider.selectedBookIds.map((bookId) {
                    Book? matchedBook = booksProvider.getBookByID(bookId);
                    if (matchedBook != null) {
                      return BookFilterCard(
                        book: matchedBook,
                      );
                    } else {
                      return Container(
                        width: 0,
                      );
                    }
                  }),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      booksProvider.selectedBookIds = [];
                    },
                    child: const Text(
                      "remove all",
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox(height: 0, width: 0);
  }
}
