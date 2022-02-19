import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/youtuber.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';

class YoutuberSimilarityTile extends StatelessWidget {
  const YoutuberSimilarityTile(
      {Key? key, required this.item, required this.percent})
      : super(key: key);

  final Youtuber item;
  final num percent;
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
      subtitle: Container(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () => Provider.of<YoutuberProvider>(context, listen: false)
              .addYoutuberToSelection(item),
          child: Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x90E8E8E8),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: const Text(
              "Add to search",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      trailing: Transform.scale(
        scale: 0.8 + percent / 2,
        child: CircularPercentIndicator(
          radius: 25.0,
          lineWidth: 5.0,
          percent: percent.toDouble(),
          center: Text(
            (percent * 100).toStringAsFixed(0) + "%",
            style: TextStyle(
                color: Color.fromRGBO((percent * 255).toInt(), 0, 0, 1)),
          ),
          progressColor: Colors.green,
        ),
      ),
    );
  }
}
