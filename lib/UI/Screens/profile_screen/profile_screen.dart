import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../Components/costum_row1.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  String docID = '';
  String imageUrl = '';
  @override
  Widget build(BuildContext context) {
    // final profileProvider =
    // Provider.of<ProfileProvider>(context, listen: false);
 User? userid=FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 6.3.w),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.7.h),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('user')
              .doc(userid!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                  child: Text(
                      'Error: ${snapshot.error}')); // * Improved error handling *
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.data?.exists == false || snapshot.data == null) {
              return Center(child: Text('No user data found.'));
            }
            // * Check if snapshot and data are not null *
            if (snapshot != null && snapshot.data != null) {
             // var docID = snapshot.data!.id;
              var userData = snapshot.data?.data() as Map<String, dynamic>?;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(children: [
                    CircleAvatar(
                      // backgroundImage: NetworkImage(snapshot.data!['image']),
                      radius: 11.h,
                      child:
                      //snapshot.data!['image'] == ''
                         // ?
                Icon(
                        Icons.person,
                        size: 130,
                      )
                         // : null,
                    ),
                    Positioned(
                        right: 5.w,
                        bottom: 1.5.h,
                        child: InkWell(
                            onTap: () async {
                            //   ImagePicker imagePicker = ImagePicker();
                            //   XFile? file = await imagePicker.pickImage(
                            //       source: ImageSource.camera);
                            //
                            //   if (file == null) return;
                            //
                            //   String uniqueFilename = DateTime.now()
                            //       .millisecondsSinceEpoch
                            //       .toString();
                            //
                            //   Reference referenceRoot =
                            //   FirebaseStorage.instance.ref();
                            //   Reference referenceDirecImages =
                            //   referenceRoot.child('images');
                            //   Reference imageUpload =
                            //   referenceDirecImages.child(uniqueFilename);
                            //
                            //   try {
                            //     await imageUpload.putFile(File(file.path));
                            //     imageUrl = await imageUpload.getDownloadURL();
                            //   } catch (e) {
                            //     print(e);
                            //   }
                            //   FirebaseFirestore.instance
                            //       .collection('Users')
                            //       .doc(docID.toString())
                            //       .update({
                            //     'image': imageUrl,
                            //   }).then((value) => Navigator.pop(context));
                            },
                            child: Icon(
                              Icons.camera_alt,
                              size: 3.3.h,
                            ))),
                  ]),
                  Text(
                    userData!['name'],
                    style:
                    TextStyle(fontSize: 3.5.h, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    userData!['email'],
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 2.3.h),
                  ),
                  Custom_Row1(text: 'Share', icon: Icons.share_outlined),
                  InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => PrivacyPolicyScreen(),
                        //     ));
                      },
                      child: Custom_Row1(
                          text: 'Privacy and Policy', icon: Icons.policy)),
                  Custom_Row1(text: 'Help and Support', icon: Icons.help),
                  Custom_Row1(
                      text: 'Invite a Friend',
                      icon: Icons.add_reaction_outlined),
                  // snapshot.data!['Role'] == 'admin'
                       InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => AdminScreen(),
                        //     ));
                      },
                      child: Custom_Row1(
                          text: 'Upload File', icon: Icons.file_upload)),

                  InkWell(
                       onTap: () {
                      //   profileProvider.logout(context);
                      },
                      child: Custom_Row1(text: 'Logout', icon: Icons.logout)),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}