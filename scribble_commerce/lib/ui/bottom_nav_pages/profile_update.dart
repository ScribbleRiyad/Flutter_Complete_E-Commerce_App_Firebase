import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scribble_commerce/ui/bottom_nav_pages/profile.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  TextEditingController? _nameController;
  TextEditingController? _phoneController;
  TextEditingController? _ageController;
  TextEditingController? _genderController;
  TextEditingController? _addressController;

  setDataToTextField(data) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50.00.h,
                decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(26.00),
                      topRight: Radius.circular(26.00),
                    )),
                child: const Center(
                    child: Text(
                  "Update Profile Info",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  helperText: "Change User Name",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                ),
                controller: _nameController =
                    TextEditingController(text: data['name']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  helperText: "Change User Phone No",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                ),
                controller: _phoneController =
                    TextEditingController(text: data['phone']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  helperText: "Change User Age",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                ),
                controller: _ageController =
                    TextEditingController(text: data['gender']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  helperText: "Change User Age",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                ),
                controller: _ageController =
                    TextEditingController(text: data['age']),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  helperText: "Change User Age",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26.00),
                        bottomLeft: Radius.circular(26.00),
                        bottomRight: Radius.circular(26.00),
                        topLeft: Radius.circular(26.00),
                      ),
                      borderSide: BorderSide(color: Colors.redAccent)),
                ),
                controller: _ageController =
                    TextEditingController(text: data['address']),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () => updateData(),
                      child: const Text("Update")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      child: const Text("Exit"),
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()),
                          )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  updateData() {
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update({
      "name": _nameController!.text,
      "phone": _phoneController!.text,
      "age": _ageController!.text,
      "gender": _genderController!.text,
      "address": _addressController!.text,
    });
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
