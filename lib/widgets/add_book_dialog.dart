import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_example/widgets/text_form_field_shadow.dart';

import '../book_state.dart';
import '../book_state_notifier.dart';

class AddBookDialog extends ConsumerWidget {
  AddBookDialog({Key? key}) : super(key: key);

  final TextEditingController bookNameController = TextEditingController();
  final TextEditingController bookAuthorContorller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final BookStateNotifier bookStateNotifier =
        ref.watch(booksProvider.notifier);
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormFieldShadow(
                child: TextField(
                    controller: bookNameController,
                    decoration:
                        textFieldDecoration(hintText: "Enter Book Name"))),
            const SizedBox(
              height: 10,
            ),
            TextFormFieldShadow(
                child: TextField(
                    controller: bookAuthorContorller,
                    decoration: textFieldDecoration(hintText: "Enter Author"))),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: width,
              child: ElevatedButton(
                  onPressed: () {
                    bookStateNotifier.addBook(Book(
                        name: bookNameController.text,
                        author: bookAuthorContorller.text));
                    Navigator.pop(context);
                  },
                  child: const Text('ADD')),
            )
          ],
        ),
      ),
    );
  }
}

InputDecoration textFieldDecoration({required String hintText}) {
  return InputDecoration(
      hintText: hintText,
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.only(right: 15, left: 15),
      enabledBorder: InputBorder.none);
}
