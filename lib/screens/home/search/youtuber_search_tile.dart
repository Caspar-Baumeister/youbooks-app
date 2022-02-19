import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';

class YoutuberSearchTile extends StatelessWidget {
  const YoutuberSearchTile(
      {Key? key, required this.item, required this.controller})
      : super(key: key);

  final Youtuber item;
  final FloatingSearchBarController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Provider.of<YoutuberProvider>(context, listen: false)
              .addYoutuberToSelection(item);
          Provider.of<YoutuberProvider>(context, listen: false)
              .removeFromSearch(item);
          controller.close();
        },
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.network(
              item.imgSrc,
              height: 50.0,
              width: 50.0,
            ),
          ),
          title: Text(item.name),
        ));
  }
}
