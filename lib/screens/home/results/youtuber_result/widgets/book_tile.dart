import 'package:flutter/material.dart';
import 'package:youbooks_app/model/books.dart';

class BookTile extends StatelessWidget {
  const BookTile({Key? key, required this.item, required this.count})
      : super(key: key);

  final Book item;
  final num count;
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
      trailing: Text(count.toStringAsFixed(0)),
    );
  }
}
