import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/books.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/shared/helper/helper_functions.dart';

class BookSimilarityTile extends StatelessWidget {
  const BookSimilarityTile(
      {Key? key, required this.item, required this.similarity})
      : super(key: key);

  final Book item;
  final num similarity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => launchURL(item.amzLink),
        child: ListTile(
          leading: ClipRRect(
            child: Image.network(
              item.imgSrc,
              height: 80.0,
              width: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(item.title),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Text(
                  item.author,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: () => Provider.of<BooksProvider>(context, listen: false)
                    .addBook(item),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.only(right: 6),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x90E8E8E8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const Text(
                    "Add to search",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          trailing: Text((similarity * 100).toStringAsFixed(0)),
        ));
  }
}
