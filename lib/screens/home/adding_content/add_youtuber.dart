import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youbooks_app/model/books.dart';
import 'package:youbooks_app/provider/books_provider.dart';
import 'package:youbooks_app/screens/home/adding_content/add_book.dart';
import 'package:youbooks_app/services/database.dart';
import 'package:youbooks_app/shared/helper/helper_functions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddYoutuberPage extends StatefulWidget {
  const AddYoutuberPage({Key? key}) : super(key: key);

  @override
  State<AddYoutuberPage> createState() => _AddYoutuberPageState();
}

class _AddYoutuberPageState extends State<AddYoutuberPage> {
  bool loading = false;

  List<String> books = <String>[];

  String youtuberName = "";
  String imgSrc = "";
  String youtube = "";

  List<Book> searchResults = <Book>[];

  setField(field, String value) {
    setState(() {
      field = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddBookPage()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.menu_book_rounded),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                onChanged: (value) => setState(() {
                  youtuberName = value;
                }),
                decoration: buildInputDecoration("Youtuber name"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              ),
              const SizedBox(height: 15),
              TextField(
                onChanged: (value) => setState(() {
                  imgSrc = value;
                }),
                decoration: buildInputDecoration("Image source"),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 15),
              TextField(
                onChanged: (value) => setState(() {
                  youtube = value;
                }),
                decoration: buildInputDecoration("Link to Youtube"),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 15),
              TextField(
                onChanged: (value) => search(value),
                decoration: buildInputDecoration("search..."),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.url,
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () => setState(() {
                            books.add(searchResults[index].id);
                            searchResults.removeWhere((element) =>
                                element.id == searchResults[index].id);
                          }),
                      child: Text(searchResults[index].title));
                },
                itemCount: min(searchResults.length, 5),
              ),
              const SizedBox(height: 15),
              ListView(
                  shrinkWrap: true, children: [...books.map((e) => Text(e))]),
              const SizedBox(height: 15),
              IgnorePointer(
                ignoring: loading,
                child: ElevatedButton(
                    onPressed: () => addBook(), child: const Text("Add book")),
              )
            ],
          ),
        ),
      ),
    );
  }

  void search(String query) {
    BooksProvider booksProvider =
        Provider.of<BooksProvider>(context, listen: false);
    print(booksProvider.books.length);
    setState(() {
      searchResults = booksProvider.books.where((book) {
        final titleLower = book.title.toLowerCase();
        final authorLower = book.author.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
      print(searchResults);
    });
  }

  Future<void> addBook() async {
    setState(() {
      loading = true;
    });
    try {
      await DataBaseService().addYoutuber(
        books: books,
        name: youtuberName,
        url: youtube,
        imgSrc: imgSrc,
      );
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: e.toString(),
        ),
      );
      setState(() {
        loading = false;
      });
      return;
    }

    showTopSnackBar(
      context,
      const CustomSnackBar.success(
        message: "book added",
      ),
    );

    setState(() {
      books = [];
      youtuberName = "";
      imgSrc = "";
      youtube = "";
      loading = false;
    });
  }
}
