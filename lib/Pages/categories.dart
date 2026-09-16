import 'package:fashion_store_app/Widgets/Custom_category_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../Widgets/Custom_text.dart';
import '../Widgets/custom_appbar.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Men',
        prefix: 'assets/svgs/arrow-left.svg',
        suffix: 'assets/svgs/cart.svg',
      ),
      body: Column(
        children: [
          //frist section
          CustomCategoryFilter(),
        ],
      ),
    );
  }
}
