import 'package:flutter/material.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class YoutuberSearchTile extends StatelessWidget {
  const YoutuberSearchTile(
      {Key? key,
      required this.item,
      required this.addItem,
      required this.controller})
      : super(key: key);

  final Youtuber item;
  final Function addItem;
  final FloatingSearchBarController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          addItem(item);
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
