import 'package:antiques_store2/utils/constanst.dart';
import 'package:flutter/material.dart';

class categories2 extends StatefulWidget {
  const categories2({super.key});

  @override
  State<categories2> createState() => _categories2State();
}

class _categories2State extends State<categories2> {
  List<String> Categories2 = [
    "1850-1910",
    "1910-1950",
    "1950-1990",
    "1990-2005"
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Categories2.length,
          itemBuilder: ((context, index) => buildCategories2(index)),
        ),
      ),
    );
  }

  Widget buildCategories2(int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 40,
                  width: 40,
                  child: Image.asset('assets/images/Kategori(1).png'),
                ),
              ),
              Text(
                Categories2[index],
                style: TextStyle(
                  fontSize: 14,
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
