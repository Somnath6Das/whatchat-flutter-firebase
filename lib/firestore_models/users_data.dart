import 'package:firestore_model/firestore_model.dart';

class UserData extends FirestoreModel<UserData> {
  String? uid;
  String? avatar;
  String? name;
  String? status;
  String? mobile;
  String? token;
  List<dynamic> stories = [];
  dynamic chats = {};
  bool story = false;
  bool? accountCreated = false;

  UserData.init({this.uid, this.mobile, this.accountCreated});
  UserData({this.uid, this.name, this.avatar});

  UserData.fromMap(Map<String, dynamic> map) {
    uid = map['uid'];
    avatar = map['avatar']?? '';
    name = map['name']?? '';
    mobile = map['mobile'];
    accountCreated = map['accountCreated'];
    stories = map['stories'] ?? [];
    story = map['story'];
    status = map['status']?? '';
    chats = map['chats'];
  }

  @override
  ResponseBuilder<UserData> get responseBuilder =>
      (map) => UserData.fromMap(map);

  @override
  Map<String, dynamic> get toMap => {
        'uid': uid,
        'avatar': avatar,
        'name': name,
        'mobile': mobile,
        'accountCreated': accountCreated,
        'stories': stories,
        'story': story,
        'status': status,
        'chats': chats
      };
}
