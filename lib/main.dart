import 'package:firebase_core/firebase_core.dart';
import 'package:firebasetest/users.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  CollectionReference Users = FirebaseFirestore.instance.collection('Users');
  late String textNote;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FireBase Test")),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            onChanged: (value) {
              textNote = value;
            },
            decoration: InputDecoration(hintText: "Enter name"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                await Users.add({'name': textNote}).then((value) => null);
                //     Navigator.of(context).push(
                //        MaterialPageRoute(builder: ((context) => NextPage())));
              },
              child: Text("Submit"))
        ],
      )),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  final nameEdititngController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nameField = 
    
    postDetailsToFirestore() async {
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      User Users = User();

      Users.name = nameEdititngController.text;
      Users.uid = Users.uid;
      await firebaseFirestore
          .collection("users")
          .doc(Users.uid)
          .set(Users.toMap());
      Navigator.pushAndRemoveUntil(
          (context),
          MaterialPageRoute(builder: (context) => NextPage()),
          (route) => false);
    }
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Next Page")),
      body: SafeArea(
        child: Column(children: [Text("Hi")]),
      ),
    );
  }
}
*/