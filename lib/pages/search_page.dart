import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yandex_advanced_hw/models/result_model.dart';
import 'package:yandex_advanced_hw/services/network_service.dart';

class YandexPage extends StatefulWidget {
  const YandexPage({super.key});

  @override
  State<YandexPage> createState() => _YandexPageState();
}

class _YandexPageState extends State<YandexPage> {
  TextEditingController loc = TextEditingController();
  Result? result; // Declare Result outside of resToObject
  String address = "";

  void getSearchedLoc(String loc) async {
    String? resultString = await NetService.searchLocation(loc);
    setState(() {
      print(resultString);
      address = resultString ?? "";
      // resToObject(resultString);
      // print(Result.fromJson(jsonDecode(resultString!)));
    });
  }

  void resToObject(String? res) {
    if (res != null) {
      try {
        result = Result.fromJson(jsonDecode(res));
        print(result!.results);
      } catch (e) {
        print("Error decoding JSON: $e");
        result = null;
      }
    } else {
      print("Something is wrong");
      result = null;
    }
  }

  @override
  void initState() {
    getSearchedLoc("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: TextField(
            controller: loc,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "Search for a location",
            ),
            onChanged: (value) {
              getSearchedLoc(value);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: [
            Text(address ?? ""),
          ],
        ),
      ),
    );
  }
}
