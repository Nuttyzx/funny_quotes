import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  // put setState()  in class State only
  // no put new
  //var i = 0939682855;

  //var quote = '\nโสดโปรดจีบ';
  static const List<String> quoteList = [  // _quoteList for private
    'น้ำขึ้นให้รีบตัก ผู้ชายทักให้รีบตอบ',
    // index 0
    'กลางคืนอย่างห่าง ตอนเช้าอย่างง่วง',
    // index 1
    'รักนะ ไอ้เด็กโง่',
    // index 2
    'อย่าโกหกเราเลยว่าไม่มีแฟน ไปโกหกแฟนเถอะว่าไม่มีเรา',
    // index 3
    'คนเราดีไม่เหมือนกัน อยู่ที่การกระทำและหน้าตา',
    // index 4
    'ที่นอนดึก เพราะสวดมนต์ไหว้พระ นะโมตัสสะ ตัดใจซะนะ เขาไม่ได้รักเรา',
    // index 5
    'ผ่าตัดหัวใจไม่ต้องใช้ยาชา เพียงแค่เธอบอกลา เราก็ชาไปทั้งหัวใจ',
    // index 7
    'ขอมองตาได้ไหม ในฐานะยายก็ได้',
    // index 8
    'อาการเบื้องต้นก็ไม่มีไข้ แต่อาการทั่วไปคือไม่มีตังค์',
    // index 9
    'ถ้าวันหนึ่งเราเดินสวนกัน โปรดอย่าเหยียบผัก',
    // index 10
  ];

  static const List<Color> colorList = [
    Colors.black,
    Colors.amber,
    Colors.blueAccent,
    Colors.green,
    Colors.cyanAccent,
    Colors.deepPurpleAccent,
    Colors.deepOrange,
    Colors.pink,
    Colors.tealAccent,
    Colors.red,
    Colors.lightBlue,
    Colors.orange,
  ];

  var quote = quoteList[0]; // state variable
  var colors = colorList[0]; //_colors for private


  var noAgainString = 0;
  var noAgainColor = 0;

  void ClickGo() {   // put _  ex. _ClickGo  for private  in variance or method

    //setSate() ใส่เฉพาะค่าที่จะ แสดงหน้าจอ อัปเดต แก้ไข บนหน้าจอ ไม่จำเป็นต้องเอาทุกบรรทัดใส่ถ้ามันไม่เกี่ยวกับจังหวะที่จะใช้ในการแสดงบนหน้าจอ

    //var newQuote; // dynamic

    setState(() {
      var rand = Random();

      var randomIndexString = rand.nextInt(quoteList.length);
      var randomIndexColor = rand.nextInt(colorList.length);
      //quote = quoteList[randomIndexString];
      //colors = colorList[randomIndexColor];



      if (randomIndexString != noAgainString) {
        noAgainString = randomIndexString;
        quote = quoteList[randomIndexString];

        if (randomIndexColor != noAgainColor) {

          noAgainColor = randomIndexColor;
          colors = colorList[randomIndexColor];
        } else {
          for (int i = 0; ; i++) {
            randomIndexColor = rand.nextInt(colorList.length);
            if (randomIndexColor != noAgainColor) {

              noAgainColor = randomIndexColor;
              colors = colorList[randomIndexColor];
              break;
            }
          }
        }
      } else if (randomIndexString == noAgainString) {
        for (int i = 0; ; i++) {
          randomIndexString = rand.nextInt(quoteList.length);
          if (randomIndexString != noAgainString) {

            noAgainString = randomIndexString;
            quote = quoteList[randomIndexString];
            break;
          }
        }

        if (randomIndexColor != noAgainColor) {

          noAgainColor = randomIndexColor;
          colors = colorList[randomIndexColor];
        } else {
          for (int i = 0; ; i++) {
            randomIndexColor = rand.nextInt(colorList.length);
            if (randomIndexColor != noAgainColor) {

              noAgainColor = randomIndexColor;
              colors = colorList[randomIndexColor];
              break;
            }
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //var i = 123;
    return Scaffold(  // Scaffold ใช้กำหนดขึ้นโครงหน้าจอ
      appBar: AppBar(title: const Text('คำคมโดนใจ')),
      floatingActionButton: FloatingActionButton(
        onPressed: ClickGo,
        child: const Center(
          child: Text(
            'Go',
            textAlign: TextAlign.center,
          ),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),//EdgeInsets.only(left: 100.0 , right: 8.0)
              child: Text(
                quote,
                style: TextStyle(
                  color: colors,
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
        ), // if put variable $i Don't put const
      )
    );
  }
}
