import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/books.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/shared/helper/helper_functions.dart';

class YoutuberTile extends StatelessWidget {
  const YoutuberTile(
      {Key? key, required this.item, required this.amountSharedBooks})
      : super(key: key);

  final Youtuber item;
  final num amountSharedBooks;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // reset book search
        BooksProvider booksProvider =
            Provider.of<BooksProvider>(context, listen: false);
        booksProvider.booksInSearch = List<Book>.from(booksProvider.books);
        booksProvider.selectedBookIds = [];
        // set youtuber search
        YoutuberProvider youtuberProvider =
            Provider.of<YoutuberProvider>(context, listen: false);
        youtuberProvider.addYoutuberToSelection(item);
        youtuberProvider.removeFromSearch(item);
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Image.network(
            item.imgSrc,
            height: 50.0,
            width: 50.0,
          ),
        ),
        title: Text(item.name),
        trailing: Text("shared books: ${amountSharedBooks.toString()}"),
      ),
    );
  }
}
