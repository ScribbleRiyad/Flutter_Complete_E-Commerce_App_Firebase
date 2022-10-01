import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scribble_commerce/const/app_colors.dart';
import 'package:scribble_commerce/ui/product_details_screen.dart';
import 'package:scribble_commerce/ui/search_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _carouselImages = [];
  var _dotPosition = 0;
  final List _products = [];
  final _firestoreInstance = FirebaseFirestore.instance;

  fetchCarouselImages() async {
    QuerySnapshot qn =
        await _firestoreInstance.collection("carousel-slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
      }
    });

    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "product-name": qn.docs[i]["product-name"],
          "product-description": qn.docs[i]["product-description"],
          "product-price": qn.docs[i]["product-price"],
          "product-img": qn.docs[i]["product-img"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: TextFormField(
              textAlign: TextAlign.center,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search_rounded),
                suffixIconColor: Colors.blueAccent,
                fillColor: Colors.white,
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.00)),
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.00)),
                    borderSide: BorderSide(color: Colors.blueAccent)),
                hintText: "Search products here",
                hintStyle: TextStyle(color: Colors.blueAccent, fontSize: 15.sp),
              ),
              onTap: () => Navigator.push(context,
                  CupertinoPageRoute(builder: (_) => const SearchScreen())),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          AspectRatio(
            aspectRatio: 2.7,
            child: CarouselSlider(
                items: _carouselImages
                    .map((item) => Padding(
                          padding: const EdgeInsets.only(left: 4, right: 4),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(item),
                                    fit: BoxFit.fill)),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (val, carouselPageChangedReason) {
                      setState(() {
                        _dotPosition = val;
                      });
                    })),
          ),

          DotsIndicator(
            dotsCount: _carouselImages.isEmpty ? 1 : _carouselImages.length,
            position: _dotPosition.toDouble(),
            decorator: DotsDecorator(
              activeColor: AppColors.appColorCode,
              color: AppColors.appColorCode.withOpacity(0.5),
              spacing: const EdgeInsets.all(2),
              activeSize: const Size(6, 6),
              size: const Size(6, 6),
            ),
          ),
          // SizedBox(
          //   height: 15.h,
          // ),
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductDetails(_products[index]))),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.00),
                      ),
                      elevation: 15,
                      child: Column(
                        children: [
                          AspectRatio(
                              aspectRatio: 1.4,
                              child: Container(
                                  color: Colors.transparent,
                                  child: Image.network(
                                    _products[index]["product-img"][0],
                                    fit: BoxFit.fill,
                                  ))),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.00, bottom: 8.00),
                            child: Text("${_products[index]["product-name"]}"),
                          ),
                          Text(_products[index]["product-price"].toString()),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      )),
    );
  }
}
