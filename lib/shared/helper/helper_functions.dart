import 'package:youbooks_app/shared/helper/helper_models.dart';

double calculateScore(
    // score is the percentage of shared books of searched books from youtuber books.
    // with a smnall penelty of the amount of books a youtuber named
    int amountSearch,
    int amountYoutuber,
    int amountShared) {
  return (amountSearch / amountShared) - (amountYoutuber / 10000);
}

int compareYoutuber(
  YoutuberWithCount a,
  YoutuberWithCount b,
  int amountSearch,
) {
  double scoreA =
      calculateScore(amountSearch, a.youtuber.books.length, a.count);
  double scoreB =
      calculateScore(amountSearch, b.youtuber.books.length, b.count);

  if (scoreA > scoreB) return 1;
  if (scoreA < scoreB) return -1;
  return 0;
}

int calculateSharedBooksAmount(
    List<String> bookIds, List<String> youtuberBookIds) {
  int sharedBooks = 0;
  for (String bookId in bookIds) {
    if (youtuberBookIds.contains(bookId)) {
      sharedBooks += 1;
    }
  }
  if (sharedBooks == 0) return 0;

  // procentage of searched books that the youtuber read
  return sharedBooks;
}
