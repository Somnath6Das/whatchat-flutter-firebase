import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:whatchat/models/calls_model.dart';
import 'package:whatchat/models/chats_model.dart';
import 'package:whatchat/models/me_model.dart';
import 'package:http/http.dart' as http;
import 'package:whatchat/models/people_model.dart';


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
      print(jsonDecode(response.body).runtimeType);
      return MeModel.fromJson(jsonDecode(response.body));
    }
    throw Exception(response.reasonPhrase);
  }

  static Future<List<ChatsModel>> chats() async {
    final response = await http.get(Uri.parse('$url/data.json'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      print(jsonDecode(response.body).runtimeType);
      return (jsonDecode(response.body) as List)
          .map((e) => ChatsModel.fromJson(e))
          .toList();
    }
    throw Exception(response.reasonPhrase);
  }

 

   static Future<List<PeopleModel>> people() async {
    final response = await http.get(Uri.parse('$url/data2.json'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      print(jsonDecode(response.body).runtimeType);
      return (jsonDecode(response.body) as List)
          .map((e) => PeopleModel.fromJson(e))
          .toList();
    }
    throw Exception(response.reasonPhrase);
  }
   static Future<List<CallsModel>> calls() async {
    final response = await http.get(Uri.parse('$url/calls.json'));
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      print(jsonDecode(response.body).runtimeType);
      return (jsonDecode(response.body) as List)
          .map((e) => CallsModel.fromJson(e))
          .toList();
    }
    throw Exception(response.reasonPhrase);
  }

}
