import 'package:flutter/material.dart';
import 'package:youbooks_app/model/books.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key, required this.item}) : super(key: key);

  final Book item;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Image.network(
          item.imgSrc,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(item.title),
      subtitle: Text(item.author),
    );
  }
}
