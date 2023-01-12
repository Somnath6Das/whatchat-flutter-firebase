import 'dart:convert';

class CallsModel {
  final String name;
  final String avatar;
  final String data;
  final String outbound;
  final String count;
  final String type;
  CallsModel({
    required this.name,
    required this.avatar,
    required this.data,
    required this.outbound,
    required this.count,
    required this.type,
  });

  factory CallsModel.fromJson(Map<String, dynamic> map) {
    return CallsModel(
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
      data: map['data'] ?? '',
      outbound: map['outbound'] ?? '',
      count: map['count'] ?? '',
      type: map['type'] ?? '',
    );
  }
}
