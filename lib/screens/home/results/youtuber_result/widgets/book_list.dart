import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/book_tile.dart';
import 'package:youbooks_app/shared/helper/helper_models.dart';
import 'package:collection/collection.dart';

// takes the youtubers that are selected
// create a list of Books with count (xc)
// for all of these youtubers, go trough the books (x) they read,
// if the book (x) exist in the book list (xc) increae its count,
// otherwise create a bookwithcount object and add it
class BookList extends StatelessWidget {
  const BookList({Key? key, required this.youtuber}) : super(key: key);

  final List<Youtuber> youtuber;

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);

    List<BookWithCount> bookWithCount = [];
    for (Youtuber yt in youtuber) {
      for (String bookId in yt.books) {
        print(bookId);
        BookWithCount? foundFit = bookWithCount.isEmpty
            ? null
            : bookWithCount.firstWhereOrNull((o) => o.book.id == bookId);
        // if the bookId does not exist in the bookWithCount list, add it
        if (foundFit == null) {
          bookWithCount.add(
              BookWithCount(book: booksProvider.getBookByID(bookId), count: 1));
        }
        // if it exist, increase the count by one
        else {
          foundFit.count += 1;
        }
      }
    }
    // Sorts the list regarding the count
    bookWithCount.sort(((b, a) => a.count.compareTo(b.count)));

    // displays the sorted list
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: bookWithCount.length,
        itemBuilder: (BuildContext context, int index) {
          return BookTile(
              item: bookWithCount[index].book,
              count: bookWithCount[index].count);
        });
  }
}
