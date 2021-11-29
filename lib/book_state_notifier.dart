import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_example/book_state.dart';

// Book State Notifier
class BookStateNotifier extends StateNotifier<List<Book>> {
  // Zero argument constructor for the super class
  BookStateNotifier() : super([]);

  // Add a Book to the state
  void addBook(Book bookToAdd) => state = [...state, bookToAdd];

  // Remove a Book from the state
  void removeBook(Book booktoRemove) => state = [
        for (final book in state)
          if (book != booktoRemove) book,
      ];
}

// The Book Provider
final StateNotifierProvider<BookStateNotifier, List<Book>> booksProvider =
    StateNotifierProvider((ref) => BookStateNotifier());
