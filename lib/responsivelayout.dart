import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: const Text(
          'Responsive Layout',
        ),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.person),
            trailing: const Icon(Icons.waves),
            title: Text(
              'person ${index + 1}',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}
