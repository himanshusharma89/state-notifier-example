import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_example/book_state.dart';

import '../book_state_notifier.dart';

class BookCard extends ConsumerWidget {
  final Book book;
  const BookCard({required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BookStateNotifier bookStateNotifier =
        ref.watch(booksProvider.notifier);
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
              onLongPress: () => bookStateNotifier.removeBook(book),
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
