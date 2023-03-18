//import 'dart:html';

import 'dart:html';

import 'calculation.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LOVE CALCULATOR ',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  TextEditingController firstname = TextEditingController();
  TextEditingController secondname = TextEditingController();
  late int score;
  void loveScore() {
    score = calculation(firstName: firstname.text, secondName: secondname.text);
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ScorePage(score: score)));
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 207, 223),
      appBar: AppBar(
        title: Text('LOVE CALCULATOR'),
        backgroundColor: Color.fromARGB(255, 245, 160, 189),
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Hero(
                tag: 'lovegif',
                child: Image.network(
                  "https://i.pinimg.com/originals/19/c1/da/19c1da5712b2c229d8972c5ab5aa602d.gif",
                  height: MediaQuery.of(context).size.height * 3 / 2,
                ),
              ),
            ),
          ),
          TextField(
            controller: firstname,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Your Name',
              hintText: 'Enter Your Name',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide:
              //       BorderSide(color: Colors.lightBlueAccent, width: 1.0),
              //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide:
              //       BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
              // ),
            ),
          ),
          TextField(
            controller: secondname,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Your Partner\'s Name',
              hintText: 'Enter Your Partner\'s Name',
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0)),
                borderSide:
                    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide:
              //       BorderSide(color: Colors.lightBlueAccent, width: 1.0),
              //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide:
              //       BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              //   borderRadius: BorderRadius.all(Radius.circular(32.0)),
              // )
            ),
          ),
          ElevatedButton(
            onPressed: loveScore,
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 245, 113, 183)),
            child: Text(
              'Calculate',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScorePage extends StatelessWidget {
  const ScorePage({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 207, 223),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Hero(
                tag: 'lovegif',
                child: Image.network(
                  "https://i.pinimg.com/originals/19/c1/da/19c1da5712b2c229d8972c5ab5aa602d.gif",
                  height: MediaQuery.of(context).size.height * 3 / 2,
                ),
              ),
            ),
          ),
          Text(
            'Your score is: $score',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ],
      ),
    );
  }
}
