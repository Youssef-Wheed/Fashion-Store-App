import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../data/category_data.dart';
import 'Custom_text.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.ontap,
  });
  final String name;
  final String price;
  final String image;
  final Function ()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 255,
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Center(child: Image.asset(image)),
                  Positioned(
                    bottom: 0,
                    right: 10,
                    left: 10,
                    child: Image.asset('assets/images/shadow.png'),
                  ),
                ],
              ),
            ),
          ),
          CustomText(
            text: name,
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomText(
                text: price,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
              Icon(Icons.favorite_border, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }
}
