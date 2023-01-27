import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:value_app/profile/bloc/profile_bloc.dart';

enum SampleItem { Camera, Gallery }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {super.key,
      required this.email,
      required this.name,
      required this.phoneNumber});
  final String name;
  final String email;
  final String phoneNumber;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // void getData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   name = prefs.getString('name');
  //   email = prefs.getString('email');
  //   phoneNumber = prefs.getString('phoneNumber');
  // }

  // @override
  // void initState() {
  //   // getData();
  //   super.initState();
  //   Timer(Duration(milliseconds: 100), getData);
  //   // context.read<ProfileBloc>().add(FetchData());
  // }

  File? imageFile;
  getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                child: imageFile == null
                    ? const CircleAvatar(
                        radius: 80.0,
                        backgroundImage:
                            AssetImage('assets/images/emptyProfilePic.jpg'))
                    : CircleAvatar(
                        radius: 80.0,
                        backgroundImage:
                            Image.file(File(imageFile.toString())).image),
              ),
              Positioned(
                bottom: 4.0,
                right: 120.0,
                child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.5)),
                    child: GestureDetector(
                        child: const Icon(FontAwesomeIcons.camera))),
              )
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF847C7C), width: 2.0))),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.user),
              title: const Text(
                'Name',
                style: TextStyle(fontSize: 18.0, color: Color(0xFFD6D1D1)),
              ),
              subtitle: Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFD9D9D9),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF847C7C), width: 2.0))),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.mailBulk),
              title: const Text(
                'Email',
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                widget.email,
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFD9D9D9),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFF847C7C), width: 2.0))),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.phone),
              title: const Text(
                'Phone Number',
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(
                widget.phoneNumber,
                style: const TextStyle(
                    fontSize: 20.0,
                    color: Color(0xFFD9D9D9),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
