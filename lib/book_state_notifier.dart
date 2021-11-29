import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:state_notifier_example/book_state.dart';

final StateNotifierProvider<BookStateNotifier, List<Book>> booksProvider =
    StateNotifierProvider((ref) => BookStateNotifier());

class BookStateNotifier extends StateNotifier<List<Book>> {
  BookStateNotifier() : super([]);

  void addBook(Book bookToAdd) => state = [...state, bookToAdd];

  void removeBook(Book booktoRemove) => state = [
        for (final book in state)
          if (book != booktoRemove) book,
      ];
}
