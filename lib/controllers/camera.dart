import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whatchat/controllers/random.dart';
import 'package:whatchat/global.dart';

class Camera {
  final ImagePicker _picker = ImagePicker();
  var imagefile;
  final onUpload;
  String? location;

  Camera(this.onUpload);
  Camera.profile({this.onUpload}) {
    location = 'profile';
  }
  Camera.stories({this.onUpload}) {
    location = 'stories';
  }
  Camera.message({this.onUpload}) {
    location = 'message';
  }
  void _takeImageFromCamera() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    imagefile = File(image!.path);
    _uploadFile();
  }

  void _takeImageFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    imagefile = File(image!.path);
    _uploadFile();
  }

  _uploadFile() {
    if (imagefile == null) return null;
    final storageRef = FirebaseStorage.instance.ref();
    var filename = '${generateRandomString(7)}.jpg';
    var path =
        '${FirebaseAuth.instance.currentUser?.uid}/${location}/${filename}';
    final imageRef = storageRef.child(path);
    imageRef.putFile(imagefile).snapshotEvents.listen((event) {
      switch (event.state) {
        case TaskState.success:
          imageRef.getDownloadURL().then((url) => onUpload(url));
          break;
        case TaskState.paused:
          break;
        case TaskState.running:
          break;
        case TaskState.canceled:
          break;
        case TaskState.error:
          break;
      }
    });
  }

  showModel(BuildContext context) {  
    return showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text('New Media'),
              message: const Text('Choose where to pick a new media'),
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      _takeImageFromGallery();
                      pop(context);
                    },
                    child: const Text('Gallery')),
                CupertinoActionSheetAction(
                    onPressed: () {
                      _takeImageFromCamera();
                      pop(context);
                    },
                    child: const Text('Camera')),
              ],
              cancelButton: CupertinoActionSheetAction(
                onPressed: () => pop(context),
                child: const Text('Cancel'),
              ),
            ));
  }
}
