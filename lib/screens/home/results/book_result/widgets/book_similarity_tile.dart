import 'package:flutter/material.dart';
import 'package:youbooks_app/model/books.dart';

class BookSimilarityTile extends StatelessWidget {
  const BookSimilarityTile(
      {Key? key, required this.item, required this.similarity})
      : super(key: key);

  final Book item;
  final double similarity;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Image.network(
          item.imgSrc,
          height: 50.0,
          width: 50.0,
        ),
      ),
      title: Text(item.title),
      subtitle: Text(item.author),
      trailing: Text((similarity * 100).toStringAsFixed(0)),
    );
  }
}
