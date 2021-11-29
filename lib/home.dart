import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_example/book_state_notifier.dart';
import 'package:state_notifier_example/widgets/add_book_dialog.dart';

import 'widgets/book_card.dart';
import 'book_state.dart';

class MyHomePage extends ConsumerWidget {
  final String title;
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final List<Book> bookList = ref.watch(booksProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.blueAccent)),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AddBookDialog()),
                    child: const Text('ADD BOOK')),
              ),
              Expanded(
                child: Center(
                  child: bookList.isEmpty
                      ? const Text("Add books to display here.")
                      : ListView.builder(
                          itemCount: bookList.length,
                          itemBuilder: (_, index) {
                            return BookCard(book: bookList[index]);
                          }),
                ),
              ),
            ],
          ),
        ));
  }
}
