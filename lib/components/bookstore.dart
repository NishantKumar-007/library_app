import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';
import 'package:library_app/components/book_list.dart';

class Bookstore extends StatefulWidget {
  @override
  _BookstoreState createState() => _BookstoreState();
}

class _BookstoreState extends State<Bookstore> {
  final List<Book> books = [
    Book(
        title: 'Flutter in Action',
        author: 'Eric Windmill',
        isAvailable: true,
        bookPath: 'lib/images/book1.jpg'),
    Book(
        title: 'Clean Code',
        author: 'Robert C. Martin',
        isAvailable: false,
        bookPath: 'lib/images/book2.jpg'),
    Book(
        title: 'The Pragmatic Programmer',
        author: 'Andrew Hunt',
        isAvailable: true,
        bookPath: 'lib/images/book3.jpg'),
    // Add more books as needed
  ];

  // Controller for the search field
  final TextEditingController _searchController = TextEditingController();

  // Filtered list of books based on search input
  List<Book> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    // Initialize filteredBooks with all books initially
    filteredBooks = books;
    // print(widget.username);
  }

  // Function to filter books based on title or author
  void _filterBooks(String searchText) {
    setState(() {
      filteredBooks = books
          .where((book) =>
              book.title.toLowerCase().contains(searchText.toLowerCase()) ||
              book.author.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _searchController,
          onChanged: _filterBooks,
          decoration: InputDecoration(
            hintText: 'Search by title or author',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: filteredBooks.length,
          itemBuilder: (context, index) {
            return BookItem(book: filteredBooks[index]);
          },
        ),
      ),
    ]);
  }
}
