import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Question {
  final String question;
  final List<String> choices;
  final String answer;

  Question({
    required this.question,
    required this.choices,
    required this.answer,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Question> questions = [
    Question(
      question: '.ใครเป็นผู้ชนะในฟุตบอลโลก 2018?',
      choices: [' อังกฤษ', 'ฝรั่งเศส', 'บราซิล', 'โครเอเชีย'],
      answer: 'ฝรั่งเศส',
    ),
    Question(
      question: '.ใครเป็นผู้ทำประตูมากที่สุดในฟุตบอลโลก?',
      choices: ['ลิโอเนล เมสซี', 'โปเกบุง', 'มิโรสลาฟ คลอสเซ์', 'คริสเตียโน โรนัลโด้'],
      answer: 'คริสเตียโน โรนัลโด้',
    ),
    Question(
      question: '.ในฟุตบอล, ทีมไหนมีชื่อเสียงว่า "Red Devil"?',
      choices: ['แมนเชสเตอร์ ซิตี้', 'ลิเวอร์พูล', 'แมนเชสเตอร์ ยูไนเต็ด', 'แอสตัน วิลล่า'],
      answer: 'แมนเชสเตอร์ ยูไนเต็ด',
    ),
    Question(
      question: '.ในการเล่นฟุตบอล กฎหมายในการหยุดเกมเมื่ออะไรเกิดขึ้น?',
      choices: ['ผู้เล่นบาดเจ็บ', 'ใบเหลืองถูกแจ้ง', 'มีฝนตกหนัก', 'การเล่นช้ามากเกินไป'],
      answer: 'ผู้เล่นบาดเจ็บ',
    ),
    Question(
      question: '.นักฟุตบอลที่ได้รางวัลบัลลงดอร์มากที่สุด?',
      choices: ['ลิโอเนล เมสซี', 'คริสเตียโน โรนัลโด้', 'คาริม เบนเซมา', 'ออร์ลิง ฮาแลนด์'],
      answer: 'ลิโอเนล เมสซี',
    ),
    Question(
      question: '.ทีมไหนชนะฟุตบอลโลกในปี 2002?',
      choices: ['อิตาลี', 'บราซิล', 'เยอรมนี', 'ญี่ปุ่น'],
      answer: 'บราซิล',
    ),
    Question(
      question: '.ใครเป็นผู้รักษาประตูยอดเยี่ยมในฟุตบอลโลก 2018?',
      choices: ['ดาบิด เดเคอา', 'อลิสซอน เบ็คเกอร์', 'ยาน โอบลัค', 'ติโบต์ กูร์ตัวส์'],
      answer: 'ติโบต์ กูร์ตัวส์',
    ),
    Question(
      question: '.สโมสรฟุตบอลไหนได้รับการเรียกว่า "เสือใต้"?',
      choices: ['แมนเชสเตอร์ ยูไนเต็ด', 'บาเยิร์น มิวนิค', 'เชลซี', 'ดอร์ทมูน'],
      answer: 'บาเยิร์น มิวนิค',
    ),
    Question(
      question: '.ใครเป็นผู้ชนะรางวัลบัลลงดอร์ประจำปี 2022?',
      choices: ['คริสเตียโน โรนัลโด้', 'ลิโอเนล เมสซี', 'กาก้า', 'คาริม เบนเซมา'],
      answer: 'คาริม เบนเซมา',
    ),
     Question(
      question: '.ใครเป็นผู้ชนะรางวัลฟุตบอลโลกในปี 2010?',
      choices: ['สเปน', 'อิตาลี', 'เยอรมนี', 'อังกฤษ'],
      answer: 'สเปน',
    ),
    // ... (additional questions)
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ผลคะแนน'),
            content: Text('คุณตอบถูก $score จาก ${questions.length} ข้อ'),
            actions: <Widget>[
              TextButton(
                child: Text('ปิด'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void checkAnswer(String answer) {
    if (answer == questions[currentQuestionIndex].answer) {
      score++;
    }
    nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questions[currentQuestionIndex].question,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Column(
            children: questions[currentQuestionIndex].choices.map((choice) {
              return ElevatedButton(
                onPressed: () {
                  checkAnswer(choice);
                },
                child: Text(choice),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}