class Book {
  String title;
  String author;
  int numberAvailable;

  //ideas:
  String isbn;
  String publicationYear;
  ReadingLevel level;

  bool isVisible; // for search

  Book({
    required this.title, 
    required this.author, 
    required this.numberAvailable,
    required this.isbn,
    required this.level,
    required this.publicationYear,
    required this.isVisible
  });
}

enum ReadingLevel {
  beginner,
  intermediate,
  advanced
}
