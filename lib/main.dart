import 'package:flutter/material.dart';
import 'package:khuthon/home/home_page.dart';
import 'package:khuthon/loading/loading_page.dart';
import 'package:khuthon/result/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Pretendard",
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontSize: 16,
            color: Color(0xFF1F1F1F),
          ),
        ),
      ),
      // routes: {
      //   '/home': (context) => HomePage(),
      //   '/loading': (context) => LoadingPage(),
      //   '/result': (context) => ResultPage(),
      // },
      home: const HomePage(),
    );
  }
}
