class Book {
  String title;
  String author;
  int numberAvailable;

  //ideas:
  String isbn;
  String publicationYear;
  ReadingLevel level;

  Book({
    required this.title, 
    required this.author, 
    required this.numberAvailable,
    required this.isbn,
    required this.level,
    required this.publicationYear
  });
}

enum ReadingLevel {
  beginner,
  intermediate,
  advanced
}
