import 'package:flutter/material.dart';
import 'package:youbooks_app/screens/home/adding_content/add_youtuber.dart';
import 'package:youbooks_app/services/database.dart';
import 'package:youbooks_app/shared/helper/helper_functions.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AddBookPage extends StatefulWidget {
  const AddBookPage({Key? key}) : super(key: key);

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  bool loading = false;

  String bookName = "";
  String authorName = "";
  String imgSrc = "";
  String amz = "";

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
                MaterialPageRoute(
                    builder: (context) => const AddYoutuberPage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.person),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              onChanged: (value) => setState(() {
                bookName = value;
              }),
              decoration: buildInputDecoration("Book name"),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 15),
            TextField(
              onChanged: (value) => setState(() {
                authorName = value;
              }),
              decoration: buildInputDecoration("Author name"),
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
                amz = value;
              }),
              decoration: buildInputDecoration("Amazon Link"),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.url,
            ),
            const SizedBox(height: 15),
            IgnorePointer(
              ignoring: loading,
              child: ElevatedButton(
                  onPressed: () => addBook(), child: const Text("Add book")),
            )
          ],
        ),
      ),
    );
  }

  Future<void> addBook() async {
    setState(() {
      loading = true;
    });
    try {
      await DataBaseService().addBook(
        id: bookName.toLowerCase(),
        title: bookName,
        author: authorName,
        amzLink: imgSrc,
        imgSrc: amz,
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
      bookName = "";
      authorName = "";
      imgSrc = "";
      amz = "";
      loading = false;
    });
  }
}
