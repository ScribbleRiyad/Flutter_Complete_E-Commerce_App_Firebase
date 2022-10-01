import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scribble_commerce/ui/bottom_nav_pages/profile_update.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _ageController;
  TextEditingController? _genderController;
  TextEditingController? _addressController;

  setDataToTextField(data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 50.00.h,
            decoration: const BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(26.00),
                  bottomLeft: Radius.circular(26.00),
                  bottomRight: Radius.circular(26.00),
                  topLeft: Radius.circular(26.00),
                )),
            child: const Center(child: Text("User Profile")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              labelText: 'Name',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
                fontSize: 20.00,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
            ),
            controller: _nameController =
                TextEditingController(text: data['name']),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              labelText: 'Phone Number',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
                fontSize: 20.00,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
            ),
            controller: _phoneController =
                TextEditingController(text: data['phone']),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              labelText: 'Gender',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
                fontSize: 20.00,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
            ),
            controller: _genderController =
                TextEditingController(text: data['gender']),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              labelText: 'Age',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
                fontSize: 20.00,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
            ),
            controller: _ageController =
                TextEditingController(text: data['age']),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            readOnly: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              labelText: 'Address',
              labelStyle: TextStyle(
                color: Color(0xFF6200EE),
                fontSize: 20.00,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(26.00),
                    bottomLeft: Radius.circular(26.00),
                  ),
                  borderSide: BorderSide(color: Colors.blueAccent)),
            ),
            controller: _addressController =
                TextEditingController(text: data['address']),
          ),
        ),
        ElevatedButton(
            child: const Text("Change Info"),
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileUpdate()),
                ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users-form-data")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return setDataToTextField(data);
          },
        ),
      )),
    );
  }
}
