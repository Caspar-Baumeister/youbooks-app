import 'package:youbooks_app/model/books.dart';
import 'package:youbooks_app/model/youtuber.dart';

class YoutuberWithCount {
  Youtuber youtuber;
  int count;

  YoutuberWithCount({required this.youtuber, required this.count});
}

class BookWithCount {
  Book book;
  double count;

  BookWithCount({required this.book, required this.count});
}
