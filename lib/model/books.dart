class Book {
  String title;
  String author;
  String imgSrc;
  String amzLink;

  Book({
    required this.title,
    required this.author,
    required this.imgSrc,
    required this.amzLink,
  });

  factory Book.fromJson(dynamic json) {
    print("inside book model");
    print(json.toString());
    return Book(
      title: json['title'],
      author: json['author'],
      imgSrc: json['imgSrc'],
      amzLink: json['amzLink'],
    );
  }
}
