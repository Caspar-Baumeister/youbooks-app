import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/youtuber_similarity_tile.dart';
import 'package:youbooks_app/shared/helper/helper_models.dart';

// takes the youtuber that are selected
// calculates the similarity for every youtuber,
// based on shared books
// draws a list with Book List Tiles
class YoutuberSimilarityList extends StatelessWidget {
  const YoutuberSimilarityList(
      {Key? key, required this.selectedYoutuber, required this.booksWithCount})
      : super(key: key);

  final List<Youtuber> selectedYoutuber;
  final List<BookWithCount> booksWithCount;

  @override
  Widget build(BuildContext context) {
    num totalBooks = 0;
    for (BookWithCount bookWithCount in booksWithCount) {
      totalBooks += bookWithCount.count;
    }

    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);
    List<YoutuberWithCount> youtuberWithpercent = List<YoutuberWithCount>.from(
        youtuberProvider.youtuber
            .where((yt) => !selectedYoutuber.contains(yt))
            .map((yt) {
      num relertivShare = 0;
      num absoluteShare = 0;

      for (BookWithCount bookWithCount in booksWithCount) {
        if (yt.books.contains(bookWithCount.book.id)) {
          relertivShare += bookWithCount.count;
          absoluteShare += 1;
        }
      }
      num percent =
          (relertivShare / totalBooks + absoluteShare / yt.books.length) / 2;
      return YoutuberWithCount(youtuber: yt, count: percent);
    }).where((youtuberWithPercent) => youtuberWithPercent.count > 0.01));

    // Sorts the list regarding the similarity
    youtuberWithpercent.sort(((b, a) => a.count.compareTo(b.count)));

    // displays the sorted list
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Center(
          child: Text(
            "Youtuber recommendations",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ),
        const SizedBox(height: 3.0),
        youtuberWithpercent.isNotEmpty
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: min(youtuberWithpercent.length, 10),
                itemBuilder: (BuildContext context, int index) {
                  return YoutuberSimilarityTile(
                      item: youtuberWithpercent[index].youtuber,
                      percent: youtuberWithpercent[index].count);
                })
            : const Center(
                child: Text("No similar Youtuber found"),
              ),
      ],
    );
  }
}
