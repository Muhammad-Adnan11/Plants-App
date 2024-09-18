import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
class AdminProvider with ChangeNotifier{
  File? _image;
  final picker=ImagePicker();
  firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;
  Future gallurayGetImage()async{
  final pickedFile=await picker.pickImage(source: ImageSource.gallery,imageQuality: 80);
   if(pickedFile !=null){
     _image=File(pickedFile.path);
     notifyListeners();
   }else{
     print('no image pick');
   }
   notifyListeners();
  }
}