// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/model/product_model.dart';
import 'package:store_app/services/get_all_product.dart';
import 'package:store_app/widget/custom_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'h';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  bool loaded = false;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      loaded = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loaded == false
        ? Scaffold(
            body: Center(
              child: Lottie.asset('assets/splash_logo.json',
                  width: 200, height: 200),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 1,
              title: const Text(
                'New Trend',
                style: TextStyle(fontSize: 22),
              ),
              centerTitle: true,
              actions: [
                Stack(children: [
                  Positioned(
                    top: 4,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                          child: Text(
                        '$count',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w800),
                      )),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: FaIcon(FontAwesomeIcons.cartPlus),
                    color: Colors.black,
                  ),
                ]),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14, top: 63),
              child: FutureBuilder<List<ProductModel>>(
                future: AllProductService().getAllProduct(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<ProductModel> products = snapshot.data!;
                    return GridView.builder(
                      itemCount: products.length,
                      physics: BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 90,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          product: products[index],
                          count: count,
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          );
  }
}
