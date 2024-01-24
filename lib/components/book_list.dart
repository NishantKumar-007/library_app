import 'package:flutter/material.dart';
import 'package:library_app/models/book.dart';

class BookItem extends StatelessWidget {
  final Book book;

  BookItem({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Color.fromRGBO(40, 62, 80, 1),
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(10.0),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(
            book.bookPath, // Replace with the book image path
            width: 40,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
          book.title,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text(
              'Author: ${book.author}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'Available: ${book.isAvailable ? 'Yes' : 'No'}',
              style: TextStyle(
                fontSize: 14.0,
                color: book.isAvailable ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onTap: () {
          // Handle tap event, e.g., navigate to book details page
        },
      ),
    );
  }
}
