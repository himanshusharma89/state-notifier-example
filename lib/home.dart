import 'package:flutter/material.dart';
import 'package:state_notifier_example/widgets/add_book_dialog.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
                        context: context, builder: (_) => AddBookDialog()),
                    child: const Text('ADD BOOK')),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                      "Add books to display here."), //TODO: Conditional Statement Here for ListView
                ),
              ),
            ],
          ),
        ));
  }
}
