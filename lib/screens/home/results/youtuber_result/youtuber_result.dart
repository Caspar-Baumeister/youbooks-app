import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/book_list.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/youtuber_filter.dart';

class YoutuberResult extends StatelessWidget {
  const YoutuberResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);
    return Column(
      children: [
        const YoutuberFilter(),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BookList(youtuber: youtuberProvider.selectedYoutuber),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.red,
                ),
              ),
              //BookSimilarityList(bookIds: booksProvider.selectedBookIds)
            ],
          ),
        )),
      ],
    );
  }
}
