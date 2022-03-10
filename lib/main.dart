import 'package:flutter/material.dart';
import 'package:flutter_application_3/uidialos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String text = 'Nothing CLicked';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red,
        //mini: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          setState(() {
            text = 'Floating Action Button in Action';
          });
        },
        icon: const Icon(Icons.save),
        label: const Text('save'),
        elevation: 10,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(text),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'List of Flutter Buttons',
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all(const StadiumBorder())),
                onPressed: () {
                  setState(() {
                    text = 'Elevated Button in Action';
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.save),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Save'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () {
                  setState(() {
                    text = 'Text Button in Action';
                  });
                },
                child: const Text('OK'),
              ),
              const SizedBox(
                height: 10,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        text = 'Text Button in ButtonBar working';
                      });
                    },
                    child: const Text('OK'),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    onPressed: () {
                      setState(() {
                        text = 'Elevated Button in Button Bar Working';
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.save),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Save'),
                      ],
                    ),
                  ),
                ],
              ),
              MaterialButton(
                color: Colors.red,
                shape: const StadiumBorder(),
                onPressed: () {
                  setState(() {
                    text = 'Material Button in Action';
                  });
                },
                child: const Text(
                  'materil Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UiDialogs(),
                    ),
                  );
                },
                child: const Text(
                    'Tap me to proceed to next page and enjoy other learnings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
