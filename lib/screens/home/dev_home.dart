import 'package:flutter/material.dart';
import 'package:youbooks_app/data/books_youtuber.dart';
import 'package:youbooks_app/screens/home/adding_content/add_book.dart';
import 'package:youbooks_app/services/database.dart';

class DevHome extends StatelessWidget {
  const DevHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            child: const Text("rebase with database"),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBookPage()),
                )
            //rebase(),
            ));
  }

  // rebase() {
  //   for (Map<String, dynamic> book in books) {
  //     DataBaseService().addBook(
  //       id: book["id"],
  //       title: book["title"],
  //       author: book["author"],
  //       amzLink: book["amz"],
  //       imgSrc: book["imgSrc"],
  //     );
  //   }
  //   for (Map<String, dynamic> yt in youtuber) {
  //     DataBaseService().addYoutuber(
  //       books: yt["books"],
  //       name: yt["name"],
  //       url: yt["url"],
  //       imgSrc: yt["imgSrc"],
  //     );
  //   }
  // }
}
