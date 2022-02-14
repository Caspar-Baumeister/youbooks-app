class Youtuber {
  List<String> books;
  String name;
  String url;
  String imgSrc;
  bool approved;

  Youtuber({
    required this.books,
    required this.name,
    required this.url,
    required this.imgSrc,
    required this.approved,
  });

  factory Youtuber.fromJson(dynamic json) {
    return Youtuber(
      books: List<String>.from(json['books'].map((e) => e.toString())),
      name: json['name'],
      url: json['url'],
      imgSrc: json['imgSrc'],
      approved: json['approved'],
    );
  }
}
