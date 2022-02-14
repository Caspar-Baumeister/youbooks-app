import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/home.dart';
import 'package:youbooks_app/shared/loading.dart';

class DataLoader extends StatelessWidget {
  const DataLoader({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);

    return (youtuberProvider.initialized && booksProvider.initialized)
        ? const Home()
        : const Loading();
  }
}
