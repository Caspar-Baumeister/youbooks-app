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
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            alignment: Alignment.centerLeft,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                const Text("Your Youtubers: "),
                // show type if type is not all
                ...youtuberProvider.selectedYoutuber
                    .map((youtuber) => YoutuberFilterCard(
                          onDismiss: () =>
                              youtuberProvider.removeFromSelection(youtuber),
                          youtuber: youtuber,
                        )),
                GestureDetector(
                  onTap: () {
                    youtuberProvider.selectedYoutuber = [];
                  },
                  child: const Text(
                    "remove all",
                    //style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          )
        : const SizedBox(height: 0, width: 0);
  }
}
