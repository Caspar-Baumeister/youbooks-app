import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/screens/home/books/book_tile.dart';

class FloatingSearchBarWidget extends StatelessWidget {
  const FloatingSearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    print(booksProvider.books[0].imgSrc);
    return FloatingSearchBar(
      hint: 'Search.....',
      openAxisAlignment: 0.0,
      axisAlignment: 0.0,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
      elevation: 4.0,
      physics: const BouncingScrollPhysics(),
      onQueryChanged: (query) {
        //Your methods will be here
      },
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: const Duration(milliseconds: 500),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const ImageIcon(AssetImage("assets/cover.png")),
            onPressed: () {
              print('Places Pressed');
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Material(
            color: Colors.white,
            child: Container(
              height: 200.0,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...booksProvider.books.map((e) => BookTile(item: e))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
