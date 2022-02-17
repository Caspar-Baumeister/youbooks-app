import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/results/book_result/widgets/book_similarity_tile.dart';
import 'package:youbooks_app/shared/helper/helper_functions.dart';
import 'package:youbooks_app/shared/helper/helper_models.dart';

// takes the books that are selected
// calculates the score for every youtuber,
// draws a list with Book List Tiles
class BookSimilarityList extends StatelessWidget {
  const BookSimilarityList({Key? key, required this.bookIds}) : super(key: key);

  final List<String> bookIds;

  @override
  Widget build(BuildContext context) {
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);

    List<BookWithCount> booksWithSimilarity = booksProvider.books
        .where((b) =>
            !bookIds.contains(b.id)) // all books x that are not in bookIds
        .map((book) {
          double bookSimilarityScore = 0;
          // for all youtuber
          for (Youtuber yt in youtuberProvider.youtuber) {
            // that contain book x
            if (yt.books.contains(book.id)) {
              // calculate the shared book amount between searched books and the yt books
              // penalize that value by the amount of books in each -> weight
              int shared = calculateSharedBooksAmount(bookIds, yt.books);
              // penalize that value by the amount of books the yt read -> weight
              double weight = shared / yt.books.length;
              // add that weight to the similarity score of book x
              bookSimilarityScore += weight;
            }
          }
          return BookWithCount(book: book, count: bookSimilarityScore);
        })
        .where((bookWithSimilarity) => bookWithSimilarity.count > 0)
        .toList();

    // Sorts the list regarding the similarity
    booksWithSimilarity.sort(((b, a) => a.count.compareTo(b.count)));

    // displays the sorted list
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: min(booksWithSimilarity.length, 10),
        itemBuilder: (BuildContext context, int index) {
          return BookSimilarityTile(
              item: booksWithSimilarity[index].book,
              similarity: booksWithSimilarity[index].count);
        });
  }
}
