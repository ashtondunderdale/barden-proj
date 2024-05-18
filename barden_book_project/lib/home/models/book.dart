class Book {
  String title;
  String author;
  String isbn;
  String coverUrl;
  
  String category;
  String lexileLevel;
  String publisher;
  String readingYear;
  String releaseYear;
  String language;
  double blScore;
  
  int numberOfCopies;

  bool isVisible; 

  Book({
    required this.title, 
    required this.author, 
    required this.numberOfCopies,
    required this.category,
    required this.isbn,
    required this.language,
    required this.lexileLevel,
    required this.blScore,
    required this.publisher,
    required this.releaseYear,
    required this.readingYear,
    required this.isVisible,
    required this.coverUrl
  });
}

