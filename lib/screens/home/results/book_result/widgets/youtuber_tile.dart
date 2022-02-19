import 'package:flutter/material.dart';
import 'package:youbooks_app/model/youtuber.dart';

class YoutuberTile extends StatelessWidget {
  const YoutuberTile(
      {Key? key, required this.item, required this.amountSharedBooks})
      : super(key: key);

  final Youtuber item;
  final num amountSharedBooks;
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
      title: Text(item.name),
      trailing: Text("shared books: ${amountSharedBooks.toString()}"),
    );
  }
}
