import 'package:flutter/material.dart';
import 'package:scribble_commerce/ui/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  late SharedPreferences logindata;
  late String username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            const CircleAvatar(
              radius: 95, // Image radius
              backgroundImage: NetworkImage(
                  'https://i.ibb.co/xXKQ8Q5/58379703-2317414068496427-5100870213482577920-n.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        child: const Center(
                          child: Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.00,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        color: Colors.red,
                      )),
                  Flexible(
                      flex: 3,
                      child: Container(
                        child: const Center(
                            child: Text(
                          "MD RIYAD MAHMUD",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold),
                        )),
                        color: Colors.green,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        child: const Center(
                            child: Text(
                          "Age",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold),
                        )),
                        color: Colors.red,
                      )),
                  Flexible(
                      flex: 3,
                      child: Container(
                        child: const Center(
                            child: Text(
                          "22",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold),
                        )),
                        color: Colors.green,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        child: const Center(
                            child: Text(
                          "Status",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold),
                        )),
                        color: Colors.red,
                      )),
                  Flexible(
                      flex: 3,
                      child: Container(
                        child: const Center(
                            child: Text(
                          "FLUTTER DEVELOPER",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold),
                        )),
                        color: Colors.green,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        child: const Center(
                            child: Center(
                                child: Text(
                          "Education",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.00,
                              fontWeight: FontWeight.bold),
                        ))),
                        color: Colors.red,
                      )),
                  Flexible(
                    flex: 3,
                    child: Container(
                      child: const Center(
                          child: Text(
                        "BSC in CSE",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.00,
                            fontWeight: FontWeight.bold),
                      )),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Flexible(
                      flex: 2,
                      child: Container(
                        child: const Center(
                          child: Text(
                            "Institution",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.00,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        color: Colors.red,
                      )),
                  Flexible(
                      flex: 3,
                      child: Container(
                        child: const Center(
                          child: Text(
                            "AIUB",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.00,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        color: Colors.green,
                      )),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "FeedBack",
                  style:
                      TextStyle(fontSize: 22.00, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                minLines: 2,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'description',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Send'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        logindata.setBool('login', true);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LogInScreen()));
                      },
                      child: const Text('LogOut'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
