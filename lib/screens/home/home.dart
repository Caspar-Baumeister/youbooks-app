import 'package:flutter/material.dart';
import 'package:youbooks_app/screens/home/dev_home.dart';
import 'package:youbooks_app/screens/home/results/result_wrapper.dart';
import 'package:youbooks_app/screens/home/search/search.dart';

// Home widget loads all books and youtuber into state
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Container(
                height: 85,
                color: Colors.red,
              ),
              const Expanded(child: ResultWrapper()),
            ],
          ),
          const Search(),
          //const DevHome()
        ],
      ),
    );
  }
}
