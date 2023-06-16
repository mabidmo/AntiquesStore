import 'package:antiques_store2/utils/constanst.dart';
import 'package:flutter/material.dart';

class Categories1 extends StatefulWidget {
  const Categories1({super.key});

  @override
  State<Categories1> createState() => _Categories1State();
}

class _Categories1State extends State<Categories1> {
  List<String> Categories1 = ["Semua", "Elektronik", "Peralatan", "Baju"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 34,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Categories1.length,
          itemBuilder: ((context, index) => buildCategories1(index)),
        ),
      ),
    );
  }

  Widget buildCategories1(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
          });
        },
        style: ElevatedButton.styleFrom(
          primary: selectedIndex == index ? kPrimaryColor : kSecondaryColor,
          textStyle: TextStyle2,
          shape: RoundedRectangleBorder(
            // Change your radius here
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Categories1[index],
                style: TextStyle(
                  fontSize: 12,
                  color: selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
