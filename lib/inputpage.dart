import 'package:flutter/material.dart';
import 'package:flutter_application_3/responsivelayout.dart';

class InputPractisePage extends StatefulWidget {
  const InputPractisePage({Key? key}) : super(key: key);

  @override
  State<InputPractisePage> createState() => _InputPractisePageState();
}

class _InputPractisePageState extends State<InputPractisePage> {
  String valuetyped = 'nothing has been typed or submitted';
  String numbertyped = 'no number typed yet';
  TextEditingController usertyped = TextEditingController();
  TextEditingController number = TextEditingController();
  @override
  void initState() {
    usertyped.text =
        'Rokeeb love Azeezah and would love to marry her as soon as possible';
    super.initState();
  }

  @override
  void dispose() {
    usertyped.dispose();
    number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text field Prctise'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Textinput(
                  controller: number,
                  keyboardtype: TextInputType.number,
                  labeltext: 'your number comes here',
                ),
                const SizedBox(
                  height: 30,
                ),
                Textinput(
                  controller: usertyped,
                  labeltext: 'your text comes here',
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.teal),
                  onPressed: () {
                    setState(() {
                      valuetyped = usertyped.text;
                      numbertyped = number.text;
                    });
                  },
                  child: const Text('submit'),
                ),
                Text(valuetyped),
                Text(numbertyped),
                const SizedBox(
                  height: 100,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(
                          builder: (context) => const ResponsiveLayout(),
                        )));
                  },
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  color: Colors.teal,
                  child: const Text(
                    'tap me to go to text input page',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Textinput extends StatelessWidget {
  const Textinput({
    Key? key,
    required this.controller,
    this.labeltext = 'your controller text comes here',
    this.keyboardtype = TextInputType.text,
  }) : super(key: key);

  final TextEditingController controller;
  final String labeltext;
  final TextInputType keyboardtype;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 21, 32, 22),
          ),
        ),
        border: const OutlineInputBorder(),
        labelText: labeltext,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 1, 20, 11),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 95, 3, 3),
          ),
        ),
      ),
    );
  }
}
