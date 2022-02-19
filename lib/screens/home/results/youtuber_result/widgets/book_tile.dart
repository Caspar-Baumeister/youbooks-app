import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/books.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key, required this.item, required this.count})
      : super(key: key);

  final Book item;
  final num count;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _launchURL(),
      child: ListTile(
        leading: ClipRRect(
          child: Image.network(
            item.imgSrc,
            height: 70.0,
            width: 70.0,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(item.title),
        subtitle: Text(item.author),
        trailing: count > 1
            ? GestureDetector(
                onTap: () {
                  YoutuberProvider youtuberProvider =
                      Provider.of<YoutuberProvider>(context, listen: false);
                  youtuberProvider.selectedYoutuber = [];
                  youtuberProvider.youtuberInSearch = [];
                  Provider.of<BooksProvider>(context, listen: false)
                      .addBook(item.id);
                },
                child: Text(
                  "by ${count.toStringAsFixed(0)}\nYoutuber's",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              )
            : null,
      ),
    );
  }

  void _launchURL() async {
    if (!await launch(item.amzLink)) throw 'Could not launch ${item.amzLink}';
  }
}
