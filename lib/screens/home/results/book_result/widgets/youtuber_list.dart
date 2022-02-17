import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/results/book_result/widgets/youtuber_tile.dart';
import 'package:youbooks_app/shared/helper/helper_functions.dart';
import 'package:youbooks_app/shared/helper/helper_models.dart';

// takes the books that are selected
// calculates the score for every youtuber,
// draws a list with Youtuber List Tiles
class YoutuberList extends StatelessWidget {
  const YoutuberList({Key? key, required this.bookIds}) : super(key: key);

  final List<String> bookIds;

  @override
  Widget build(BuildContext context) {
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);

    // Adds the percentage of shared books to each youtuber
    List<YoutuberWithCount> youtuberWithCount = youtuberProvider.youtuber
        .map(
          (yt) {
            int amoutSharedBooks =
                calculateSharedBooksAmount(bookIds, yt.books);
            return YoutuberWithCount(
              youtuber: yt,
              count: amoutSharedBooks,
            );
          },
        )
        .where((YoutuberWithCount i) => i.count > 0)
        .toList();

    // Sorts the list regarding the score
    youtuberWithCount.sort(((a, b) => compareYoutuber(a, b, bookIds.length)));

    // displays the sorted list
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: youtuberWithCount.length,
        itemBuilder: (BuildContext context, int index) {
          return YoutuberTile(
              item: youtuberWithCount[index].youtuber,
              amountSharedBooks: youtuberWithCount[index].count);
        });
  }
}
