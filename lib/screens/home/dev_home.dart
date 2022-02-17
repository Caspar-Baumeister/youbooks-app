import 'package:flutter/material.dart';
import 'package:youbooks_app/data/books_youtuber.dart';
import 'package:youbooks_app/services/database.dart';

class DevHome extends StatelessWidget {
  const DevHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: const Text("rebase with database"),
      onPressed: () => rebase(),
    ));
  }

  rebase() {
    for (Map<String, dynamic> book in books) {
      DataBaseService().addBook(
        id: book["id"],
        title: book["title"],
        author: book["author"],
        amzLink: book["amz"],
        imgSrc: book["imgSrc"],
      );
      print("added ${book["title"]}");
    }
    for (Map<String, dynamic> yt in youtuber) {
      DataBaseService().addYoutuber(
        books: yt["books"],
        name: yt["name"],
        url: yt["url"],
        imgSrc: yt["imgSrc"],
      );
      print("added ${yt["name"]}");
    }
  }
}
