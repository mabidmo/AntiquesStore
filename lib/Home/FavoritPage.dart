import 'dart:ffi';

import 'package:antiques_store2/Home/HomePage/itemCard.dart';
import 'package:antiques_store2/models/product.dart';
import 'package:antiques_store2/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({super.key});

  @override
  State<FavoritPage> createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kPrimaryColor,
              ),
              height: 100,
              width: 300,
            ),
          )
        ]),
      ),
    );
  }
}

class itemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const itemCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Container(
            height: 230,
            width: 172,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(13),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 141,
                  margin: EdgeInsets.only(top: 14),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RichText(
                    text: TextSpan(
                        text: product.title,
                        style: TextStyle2,
                        children: <TextSpan>[
                          TextSpan(
                            text: ' (',
                            style: TextStyle2,
                          ),
                          TextSpan(
                            text: product.tahun,
                            style: TextStyle2,
                          ),
                          TextSpan(
                            text: ')',
                            style: TextStyle2,
                          ),
                        ]),
                  ),
                ),
                Text(
                  "Rp ${product.price}",
                  style: TextStyle2,
                ),
                ElevatedButton(
                  onPressed: press,
                  style: RoundedButtonStyle2,
                  child: Container(
                    height: 19,
                    width: 50,
                    child: Center(
                      child: Text('Details', style: TextStyle1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
