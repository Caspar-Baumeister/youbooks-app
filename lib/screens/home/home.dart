import 'package:flutter/material.dart';
import 'package:youbooks_app/screens/home/search/search.dart';
import 'package:youbooks_app/screens/home/search_result/search_result.dart';

// Home widget loads all books and youtuber into state
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Search();
  }
}
