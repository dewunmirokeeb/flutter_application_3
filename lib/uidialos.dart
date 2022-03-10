import 'package:flutter/material.dart';

class UiDialogs extends StatefulWidget {
  const UiDialogs({Key? key}) : super(key: key);

  @override
  State<UiDialogs> createState() => _UiDialogsState();
}

class _UiDialogsState extends State<UiDialogs> {
  final snackbar = SnackBar(
    content: const Text('Successfully save'),
    duration: const Duration(seconds: 10),
    action: SnackBarAction(label: 'undo', onPressed: () {}),
  );
  String delete = 'No choice made';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 224, 212, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              },
              child: const Text('save'),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Center(
                          child: Text(
                            'Delete entry 12345',
                          ),
                        ),
                        content: const Text(
                          'are you sure that you want to delete the entry',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                delete = 'You selected Yes';
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                delete = 'You selected No';
                              });
                              Navigator.pop(context);
                            },
                            child: const Text('No'),
                          ),
                        ],
                      );
                    });
              },
              child: const Text('Delete'),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(delete),
          ],
        ),
      ),
    );
  }
}
