class Book {
  String title;
  String author;
  bool isAvailable;
  int numberAvailable;

  //ideas:
  String isbn;
  DateTime publicationYear;
  int pages;
  ReadingLevel level;

  Book({
    required this.title, 
    required this.author, 
    required this.isAvailable,
    required this.numberAvailable,
    required this.isbn,
    required this.level,
    required this.pages,
    required this.publicationYear
  });
}

enum ReadingLevel {
  beginner,
  intermediate,
  advanced
}
