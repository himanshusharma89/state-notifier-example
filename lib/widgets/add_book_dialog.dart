import 'package:flutter/material.dart';
import 'package:state_notifier_example/widgets/text_form_filed_shadow.dart';

class AddBookDialog extends StatelessWidget {
  AddBookDialog({Key? key}) : super(key: key);

  TextEditingController bookNameController = TextEditingController();
  TextEditingController bookAuthorContorller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
                    //TODO: Book Add Method here
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
