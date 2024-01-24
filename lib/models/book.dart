class Book {
  final String title;
  final String author;
  final bool isAvailable;
  final String bookPath;

  Book(
      {required this.title,
      required this.author,
      required this.isAvailable,
      required this.bookPath});
  Book.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        author = map['author'],
        isAvailable = map['isAvailable'],
        bookPath = map['bookPath'];
}
