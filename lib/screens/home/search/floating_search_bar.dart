import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/provider/youtuber_provider.dart';
import 'package:youbooks_app/screens/home/search/book_search_tile.dart';
import 'package:youbooks_app/screens/home/search/youtuber_search_tile.dart';

class FloatingSearchBarWidget extends StatefulWidget {
  const FloatingSearchBarWidget({Key? key, required this.onChange})
      : super(key: key);

  final onChange;

  @override
  State<FloatingSearchBarWidget> createState() =>
      _FloatingSearchBarWidgetState();
}

class _FloatingSearchBarWidgetState extends State<FloatingSearchBarWidget> {
  FloatingSearchBarController _floatingSearchBarController =
      FloatingSearchBarController();
  @override
  Widget build(BuildContext context) {
    BooksProvider booksProvider = Provider.of<BooksProvider>(context);
    YoutuberProvider youtuberProvider = Provider.of<YoutuberProvider>(context);

    return FloatingSearchBar(
      controller: _floatingSearchBarController,
      hint: 'Search for book or youtuber',
      automaticallyImplyDrawerHamburger: false,
      openAxisAlignment: 0.0,
      axisAlignment: 0.0,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 20),
      elevation: 4.0,
      physics: const BouncingScrollPhysics(),
      onQueryChanged: widget.onChange,
      transitionCurve: Curves.easeInOut,
      transitionDuration: const Duration(milliseconds: 500),
      transition: CircularFloatingSearchBarTransition(),
      debounceDelay: const Duration(milliseconds: 500),
      // actions: [
      //   FloatingSearchBarAction(
      //     showIfOpened: false,
      //     child: CircularButton(
      //       icon: const ImageIcon(AssetImage("assets/cover.png")),
      //       onPressed: () {
      //         print('Places Pressed');
      //       },
      //     ),
      //   ),
      //   FloatingSearchBarAction.searchToClear(
      //     showIfClosed: false,
      //   ),
      //   FloatingSearchBarAction.icon(
      //       showIfClosed: false,
      //       showIfOpened: true,
      //       icon: const Icon(Icons.clear),
      //       onTap: () {
      //         // FloatingSearchBar.of(context)
      //         _floatingSearchBarController.clear();
      //         _floatingSearchBarController.close();
      //         // FloatingSearchBar.of(context).close();
      //         // final bar = FloatingSearchAppBar.of(context);
      //         // bar.clear();
      //         // print(bar);
      //       }),
      // ],
      builder: (context, transition) {
        return DropDownSearch(
            booksProvider: booksProvider,
            floatingSearchBarController: _floatingSearchBarController,
            youtuberProvider: youtuberProvider);
      },
    );
  }
}

class DropDownSearch extends StatelessWidget {
  const DropDownSearch({
    Key? key,
    required this.booksProvider,
    required FloatingSearchBarController floatingSearchBarController,
    required this.youtuberProvider,
  })  : _floatingSearchBarController = floatingSearchBarController,
        super(key: key);

  final BooksProvider booksProvider;
  final FloatingSearchBarController _floatingSearchBarController;
  final YoutuberProvider youtuberProvider;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Material(
        color: Colors.white,
        child: Container(
          height: 350.0,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...youtuberProvider.selectedYoutuber.isEmpty
                    ? booksProvider.booksInSearch.map((e) => BookSearchTile(
                          item: e,
                          addItem: booksProvider.addBook,
                          controller: _floatingSearchBarController,
                        ))
                    : [],
                ...booksProvider.selectedBookIds.isEmpty
                    ? youtuberProvider.youtuberInSearch
                        .map((e) => YoutuberSearchTile(
                              item: e,
                              addItem: youtuberProvider.addYoutuber,
                              controller: _floatingSearchBarController,
                            ))
                    : [],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
