import 'package:flutter/material.dart';
import 'package:youbooks_app/model/books.dart';

class BookFilterCard extends StatelessWidget {
  const BookFilterCard({
    required this.book,
    required this.onDismiss,
    Key? key,
  }) : super(key: key);
  final Book book;
  final Function onDismiss;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        //side: const BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(45.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 120),
              child: Text(
                book.title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 5.0),
            IconButton(
              constraints: const BoxConstraints(maxHeight: 12),
              padding: const EdgeInsets.all(0.0),
              iconSize: 12.0,
              onPressed: () => onDismiss(),
              icon: const Icon(
                Icons.close_rounded,
                size: 12.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
