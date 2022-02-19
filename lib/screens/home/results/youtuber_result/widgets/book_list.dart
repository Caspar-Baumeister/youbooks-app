import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/book_tile.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/show_more_button.dart';
import 'package:youbooks_app/shared/helper/helper_models.dart';

class BookList extends StatefulWidget {
  const BookList({Key? key, required this.booksWithCount}) : super(key: key);

  final List<BookWithCount> booksWithCount;

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  int showAmount = 8;
  @override
  Widget build(BuildContext context) {
    // displays the sorted list
    return Column(
      children: [
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: min(widget.booksWithCount.length, showAmount),
            itemBuilder: (BuildContext context, int index) {
              return BookTile(
                  item: widget.booksWithCount[index].book,
                  count: widget.booksWithCount[index].count);
            }),
        showAmount < widget.booksWithCount.length
            ? const SizedBox(height: 5)
            : Container(),
        showAmount < widget.booksWithCount.length
            ? Center(
                child: ShowMoreButton(
                  onPressed: (() => setState(() {
                        showAmount += 5;
                      })),
                  text: "Show more",
                ),
              )
            : Container(),
      ],
    );
  }
}
