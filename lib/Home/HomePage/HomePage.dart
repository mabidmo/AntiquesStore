import 'package:antiques_store2/Home/HomePage/Categories1.dart';
import 'package:antiques_store2/Home/HomePage/Categories2.dart';
import 'package:antiques_store2/Home/HomePage/detailScreens.dart';
import 'package:antiques_store2/Home/HomePage/itemCard.dart';
import 'package:antiques_store2/models/product.dart';
import 'package:antiques_store2/utils/constanst.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: ScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 9),
            child: Categories1(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Kategori Tahun',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          categories2(),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Produk',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 1000,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.73,
                  ),
                  itemBuilder: ((context, index) => itemCard(
                        product: products[index],
                        press: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    detailScreens(product: products[index]))),
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//Kategori 1

//Kategori 2
