import 'package:fashion_store_app/Pages/product_details.dart';
import 'package:fashion_store_app/Widgets/Custom_category_filter.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Widgets/Custom_product_item.dart';
import '../Widgets/custom_appbar.dart';
import '../data/product_data.dart';

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
          //frist section - fixed at top
          CustomCategoryFilter(),
          Gap(15),
          //products - scrollable
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                itemCount: products.length,
                addRepaintBoundaries: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1 / 1.9,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CustomProductItem(
                    product: product,
                    ontap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => ProductDetails(product: product),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
