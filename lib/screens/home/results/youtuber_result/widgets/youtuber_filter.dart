import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/results/youtuber_result/widgets/youtuber_filter_card.dart';

class YoutuberFilter extends StatelessWidget {
  const YoutuberFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);
    // dont show filter if type is all and no category is selected
    return youtuberProvider.selectedYoutuber.isNotEmpty
        ? Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const Text(
                    "Your Youtubers: ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  // show type if type is not all
                  ...youtuberProvider.selectedYoutuber
                      .map((youtuber) => YoutuberFilterCard(
                            onDismiss: () {
                              youtuberProvider.removeFromSelection(youtuber);
                              youtuberProvider.addYoutuberToSearch(youtuber);
                            },
                            youtuber: youtuber,
                          )),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: () {
                      youtuberProvider.selectedYoutuber = [];
                      youtuberProvider.resetSearch();
                    },
                    child: const Text(
                      "remove all",
                      //style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox(height: 0, width: 0);
  }
}
