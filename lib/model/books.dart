class Book {
  String id;
  String title;
  String author;
  String imgSrc;
  String amzLink;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.imgSrc,
    required this.amzLink,
  });

  factory Book.fromJson(String id, dynamic json) {
    return Book(
      id: id,
      title: json['title'],
      author: json['author'],
      imgSrc: json['imgSrc'],
      amzLink: json['amzLink'],
    );
  }
}
