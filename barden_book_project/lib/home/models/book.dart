class Book {
  String title;
  String author;
  String isbn;
  String coverUrl;
  
  String category;
  String lexileLevel;
  String publisher;
  String readingYear; // year 5, year 4, etc
  String releaseYear;
  String language;
  String blScore;
  
  int numberAvailable;

  bool isVisible; 

  Book({
    required this.title, 
    required this.author, 
    required this.numberAvailable,
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

