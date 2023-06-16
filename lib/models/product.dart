import 'package:flutter/material.dart';

class Product {
  final String image, title, description, tahun;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
    required this.tahun,
  });
}

List<Product> products = [
  Product(
      id: 1,
      title: "Cangkir Antik",
      tahun: "1987",
      price: 20000,
      size: 12,
      description: dummyText,
      image: "assets/images/product/antik1.JPG",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Ceret Antik",
      tahun: "1987",
      price: 30000,
      size: 8,
      description: dummyText,
      image: "assets/images/product/antik2.jpg",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Hang Top",
      price: 40000,
      tahun: "1987",
      size: 10,
      description: dummyText,
      image: "assets/images/product/antik3.jpg",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Old Fashion",
      price: 25000,
      tahun: "1987",
      size: 11,
      description: dummyText,
      image: "assets/images/product/antik4.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Office Code",
      price: 35000,
      tahun: "1987",
      size: 12,
      description: dummyText,
      image: "assets/images/product/antik5.jpg",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Office Code",
    price: 10000,
    tahun: "1987",
    size: 12,
    description: dummyText,
    image: "assets/images/product/antik6.jpg",
    color: Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
