import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scribble_commerce/const/app_colors.dart';

import 'package:scribble_commerce/ui/login_screen.dart';
import 'package:scribble_commerce/widgets/custom_button.dart';
import 'package:scribble_commerce/widgets/my_textfield.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  List<String> gender = ["Male", "Female", "Other"];

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }
  }

  sendUserDataToDB() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;

    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-form-data");
    return _collectionRef.doc(currentUser!.email).set({
      "name": _nameController.text,
      "phone": _phoneController.text,
      "dob": _dobController.text,
      "gender": _genderController.text,
      "age": _ageController.text,
      "address": _addressController.text,
    }).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (_) => const LogInScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "Welcome ",
                    style: TextStyle(
                        fontSize: 30.sp,
                        color: AppColors.appColorCode,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Submit the form to continue.",
                      style: TextStyle(
                          fontSize: 22.sp, color: AppColors.appColorCode),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "We will not share your information with anyone.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFFA09999),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextField(
                      "Enter Your Name", TextInputType.text, _nameController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextField("Enter Your Phone Number",
                      TextInputType.number, _phoneController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Select Your Date of Birth",
                      suffixIcon: IconButton(
                        onPressed: () => _selectDateFromPicker(context),
                        icon: const Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _genderController,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Choose Your Gender",
                      prefixIcon: DropdownButton<String>(
                        dropdownColor: Colors.redAccent,
                        iconEnabledColor: Colors.greenAccent,
                        items: gender.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              setState(() {
                                _genderController.text = value;
                              });
                            },
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextField(
                      "Enter your Age", TextInputType.number, _ageController),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: myTextField("Enter your Address", TextInputType.text,
                      _addressController),
                ),

                SizedBox(
                  height: 50.h,
                ),

                // elevated button
                customButton("Continue", () => sendUserDataToDB()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
