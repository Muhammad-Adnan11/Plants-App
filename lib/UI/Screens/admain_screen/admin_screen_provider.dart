import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AdminProvider with ChangeNotifier {
  TextEditingController plantname = TextEditingController();
  TextEditingController plantDescription = TextEditingController();
  TextEditingController plantprice = TextEditingController();
  List<String> listitem = [
    'Popular 1',
    'Outdoor 2',
    'Indoor 3',
    'Fashion 4'
  ];
  var valuechoose = 'Popular 1';
  String _imageurl = '';
  String _imagePath = '';
  String get imageurl => _imageurl;
  String get imagePath => _imagePath;
  File? _image;
  File? get image => _image;
  final picker = ImagePicker();
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Future gallurayGetImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      notifyListeners();
    } else {
      print('no image pick');
    }
    notifyListeners();
  }

  void addToFireStore(String cal) async {
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('Image').child(DateTime.now().millisecond.toString());
    firebase_storage.UploadTask uploadTask = ref.putFile(image!.absolute);
    await Future.value(uploadTask);
    _imageurl = await ref.getDownloadURL();
    _imagePath = ref.fullPath;
    print(_imageurl);
    print(_imagePath);
    await FirebaseFirestore.instance.collection(cal).doc().set({
      'plant Name': plantname.text.trim(),
      'Plant Description': plantDescription.text.trim(),
      'Plant Price': int.tryParse(plantprice.text.trim()) ?? 0,
      //'Plant Price':plantprice.text.trim(),
      'image_url': _imageurl,
      'image_path': _imagePath,
    });
    notifyListeners();
  }

  void selectedcategory(value) {
    valuechoose = value;
    notifyListeners();
  }
}
