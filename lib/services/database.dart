import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  DataBaseService();

  // collection reference
  final CollectionReference booksCollection =
      FirebaseFirestore.instance.collection('books');

  final CollectionReference youtuberCollection =
      FirebaseFirestore.instance.collection('youtubers');

  // get all books
  Future<List<Object?>> getAllBook() async {
    print("inside databse getallbooks");

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await booksCollection.get();

    // Get data from docs and convert map to List
    final List<Object?> allData =
        querySnapshot.docs.map((doc) => doc.data()).toList();
    print("inside databse getallbooks");
    print(allData[0].toString());

    return allData;
  }

  // get all books
  Future<List<Object?>> getAllYoutuber() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await youtuberCollection.get();

    // Get data from docs and convert map to List
    final List<Object?> allData =
        querySnapshot.docs.map((doc) => doc.data()).toList();

    return allData;
  }

  // get book by id
  Future<DocumentSnapshot<Object?>> getBook(bid) async {
    return booksCollection.doc(bid).get();
  }

  // get youtuber by id
  Future<DocumentSnapshot<Object?>> getYoutuber(yid) async {
    return youtuberCollection.doc(yid).get();
  }

  // create book
  Future addBook(
      {required String id,
      required String title,
      required String author,
      required String amzLink,
      required String imgSrc}) async {
    final newBook = {
      'title': title,
      'author': author,
      'imgSrc': imgSrc,
      'amzLink': amzLink,
    };

    await booksCollection.doc(id).set(newBook);
  }

  // create Youtuber
  Future addYoutuber(
      {required List<String> books,
      required String name,
      required String url,
      required String imgSrc}) async {
    final newYoutuber = {
      'books': books,
      'name': name,
      'url': url,
      'imgSrc': imgSrc,
      'approved': true
    };
    String id = nameToId(name);

    await youtuberCollection.doc(id).set(newYoutuber);
  }

  String nameToId(String title) {
    return title.replaceAll(' ', '').toLowerCase();
  }
}
