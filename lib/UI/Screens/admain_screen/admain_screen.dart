import 'dart:io';

import 'package:flutter/material.dart';
import 'package:plants_mart/UI/Components/CostumTextfield.dart';
import 'package:plants_mart/UI/Screens/admain_screen/admin_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AdmainScreen extends StatefulWidget {
  const AdmainScreen({super.key});

  @override
  State<AdmainScreen> createState() => _AdmainScreenState();
}
class _AdmainScreenState extends State<AdmainScreen> {
  @override
  Widget build(BuildContext context) {
    print('rebuild');
    final admin = Provider.of<AdminProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Admain'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  admin.gallurayGetImage();
                },
                child: CircleAvatar(
                  backgroundImage: admin.image != null ?

                  FileImage(File(admin.image!.path)) : null,
                  child: admin.image == null ?
                  Text('Image pick') : null,
                  maxRadius: 60,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                      label: Text('Plant',style: TextStyle(color: Colors.black),),
                      hintText: 'Plants management',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                  ),
              ),
              SizedBox(
                height: 13,
              ),
              TextField(
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                      label: Text('Description',style: TextStyle(color: Colors.black),),
                      hintText: 'Plant Description ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                  ),
              ),
              SizedBox(
                height: 13,
              ),
              TextField(
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                      label: Text('Price',style: TextStyle(color: Colors.black),),
                      hintText: 'Plant price',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                  ),
              ),
              SizedBox(
                height: 20,
              ),
            InkWell(
              onTap: ()async {
              firebase_storage.Reference ref=firebase_storage.FirebaseStorage.instance.ref().child('path').child('image');
              firebase_storage.UploadTask uploadTask = ref.putFile(admin.image!.absolute);
               await Future.value(uploadTask);
               var newurl = ref.getDownloadURL();
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(child: Text('Upload Image',style: TextStyle(color: Colors.black,fontSize: 18),
                ),
                ),
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
