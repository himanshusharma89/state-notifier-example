import 'package:flutter/material.dart';
import 'package:state_notifier_example/book_state.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(3, 3),
                    color: Colors.grey.shade300,
                    blurRadius: 5)
              ]),
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
              onLongPress: () {
                //TODO: Add Remove Book Method Here
              },
              title: Text(
                book.name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                book.author,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.book,
                size: 50,
              ))),
    );
  }
}
