import 'package:antiques_store2/models/product.dart';
import 'package:antiques_store2/utils/constanst.dart';
import 'package:flutter/material.dart';

class detailScreens extends StatelessWidget {
  final Product product;

  const detailScreens({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                height: 320,
                width: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: product.title,
                          style: TextProduct,
                          children: <TextSpan>[
                            TextSpan(
                              text: ' (',
                              style: TextProduct,
                            ),
                            TextSpan(
                              text: product.tahun,
                              style: TextProduct,
                            ),
                            TextSpan(
                              text: ')',
                              style: TextProduct,
                            ),
                          ]),
                    ),
                    Text(
                      "Rp ${product.price}",
                      style: TextStyle3,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 51,
                  width: 51,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.favorite,
                    size: 35,
                    color: kSecondaryColor,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Checkout',
                  style: TextStyle(color: Colors.white),
                ),
                style: RoundedButtonStyle,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomBar extends StatelessWidget with PreferredSizeWidget {
  const CustomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            Text(
              'Produk',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 30,
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(57.0);
}
