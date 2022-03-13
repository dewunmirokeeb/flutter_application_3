import 'package:flutter/material.dart';
import 'package:flutter_application_3/inputpage.dart';

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
  String savestatus = 'No choice selected yet';
  String delete = 'No choice made';
  String location = 'None selected yet';
  String deletestatus = 'Delete Status: Not selected yet';
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      backgroundColor: const Color.fromARGB(255, 224, 212, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: const Text('save'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                setState(() {
                  savestatus = 'save';
                });
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Text(savestatus),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              child: const Text('Delete'),
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
            ),
            const SizedBox(
              height: 5,
            ),
            Text(delete),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
              ),
              onPressed: () async {
                final String loc = await showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) {
                    return SimpleDialog(
                      title: const Text('Choose your children'),
                      children: [
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'Nigeria');
                          },
                          child: const Text('Nigeria'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'America');
                          },
                          child: const Text('America'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'India');
                          },
                          child: const Text('India'),
                        ),
                      ],
                    );
                  },
                );
                setState(() {
                  location = loc;
                });
              },
              child: const Text('choose Location'),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(location),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 182, 14, 233)),
              onPressed: () {
                scaffoldkey.currentState?.showBottomSheet((context) {
                  return Container(
                    height: 110,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Are you sure you wanna delete',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  deletestatus = 'Yes';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  deletestatus = 'No';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  );
                });
              },
              child: const Text('Buttom Nav Drawer'),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(deletestatus),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    (MaterialPageRoute(
                      builder: (context) => const InputPractisePage(),
                    )));
              },
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              color: Colors.black,
              child: const Text(
                'tap me to go to text input page',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
