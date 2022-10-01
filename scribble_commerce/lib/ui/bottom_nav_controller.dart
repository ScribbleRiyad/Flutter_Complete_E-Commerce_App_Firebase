import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scribble_commerce/const/app_colors.dart';
import 'package:scribble_commerce/ui/bottom_nav_pages/cart.dart';
import 'package:scribble_commerce/ui/bottom_nav_pages/favourite.dart';
import 'package:scribble_commerce/ui/bottom_nav_pages/home.dart';
import 'package:scribble_commerce/ui/bottom_nav_pages/logout.dart';
import 'package:scribble_commerce/ui/bottom_nav_pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({Key? key}) : super(key: key);

  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  late SharedPreferences logindata;
  late String username;
  final _pages = [
    const Home(),
    const Favourite(),
    const Cart(),
    const Profile(),
    const LogOut()
  ];
  var _currentIndex = 0;

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(
            height: 90.00.h,
            child: Image.asset('assets/images/scribble-logo-animation.gif')),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: AppColors.appColorCode,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: "Favourite"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout_outlined),
            label: "Logout",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
