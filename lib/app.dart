import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yandex_advanced_hw/pages/search_page.dart';

void runner() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: YandexPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
