import 'package:flutter/material.dart';
import 'package:youbooks_app/screens/home/search/search.dart';
import 'package:youbooks_app/screens/home/search_result/search_result.dart';

// Home widget loads all books and youtuber into state
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white, appBar: HomeAppBar(), body: HomeBody());
  }
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      title: const Text("Acroworld", style: TextStyle(color: Colors.black)),
      leading: null,
      actions: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text(
            "something",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   youtuber.forEach((e) {
  //     DataBaseService().addYoutuber(
  //         name: e["channelName"],
  //         url: e["channelLink"],
  //         books: e["books"],
  //         imgSrc: e["channelImgSrc"]);
  //     print("${e["channelName"]} added");
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [Search(), SearchResult()],
    );
  }
}
