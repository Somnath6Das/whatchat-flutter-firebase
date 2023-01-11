import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whatchat/models/chats.dart';
import 'package:whatchat/models/me_model.dart';
import 'package:http/http.dart' as http;

class AppColors {
  static Color? primary = Colors.lightBlue;
  static Color? bottomTabBarBackground = Colors.white;
}

const url = 'https://somnath6das.github.io/api';

class WhatChat {
  static const whatChat = '$url/data3.json';
  static Future<MeModel> me() async {
    final response = await http.get(Uri.parse(whatChat));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return MeModel.fromJson(jsonDecode(response.body));
    }
    throw Exception(response.reasonPhrase);
  }

  static Future<List<ChatsModel>> chats() async {
    final response = await http.get(Uri.parse('$url/data.json'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      return (jsonDecode(response.body) as List)
          .map((e) => ChatsModel.fromJson(e))
          .toList();
    }
    throw Exception(response.reasonPhrase);
  }
}
