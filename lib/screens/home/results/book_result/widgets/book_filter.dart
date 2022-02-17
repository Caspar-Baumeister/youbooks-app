import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text("Your books: "),
                // show type if type is not all
                ...booksProvider.selectedBookIds.map((bookId) => BookFilterCard(
                      onDismiss: () =>
                          booksProvider.removeFromSelection(bookId),
                      book: booksProvider.getBookByID(bookId),
                    )),
                GestureDetector(
                  onTap: () {
                    booksProvider.selectedBookIds = [];
                  },
                  child: const Text(
                    "remove all",
                    //style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          )
        : const SizedBox(height: 0, width: 0);
  }
}
