import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/results/book_result/widgets/book_similarity_list.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/book_list.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/youtuber_filter.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/youtuber_similarity_list.dart';
import 'package:youbooks_app/shared/helper/helper_models.dart';
import 'package:collection/collection.dart';

class YoutuberResult extends StatelessWidget {
  const YoutuberResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);

// These are all the books recommended by the youtubers you selected:
// create a list of Books with count (xc)
// for all selected youtubers, go trough the books (x) they read,
// if: (the book (x) exist in the book list (xc)) increae its count,
// else: create a bookwithcount object and add it
    List<BookWithCount> booksWithCount = [];
    for (Youtuber yt in youtuberProvider.selectedYoutuber) {
      for (String bookId in yt.books) {
        BookWithCount? foundFit = booksWithCount.isEmpty
            ? null
            : booksWithCount.firstWhereOrNull((o) => o.book.id == bookId);
        // if the bookId does not exist in the bookWithCount list, add it
        if (foundFit == null) {
          booksWithCount.add(
              BookWithCount(book: booksProvider.getBookByID(bookId), count: 1));
        }
        // if it exist, increase the count by one
        else {
          foundFit.count += 1;
        }
      }
    }
    // Sorts the list regarding the count
    booksWithCount.sort(((b, a) => a.count.compareTo(b.count)));

    return Column(
      children: [
        const YoutuberFilter(),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BookList(booksWithCount: booksWithCount),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.red,
                ),
              ),
              YoutuberSimilarityList(
                  booksWithCount: booksWithCount,
                  selectedYoutuber: youtuberProvider.selectedYoutuber)
            ],
          ),
        )),
      ],
    );
  }
}
