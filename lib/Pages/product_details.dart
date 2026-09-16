import 'package:fashion_store_app/Models/product_model.dart';
import 'package:flutter/material.dart';
import '../Widgets/Custom_category_filter.dart';
import '../Widgets/custom_appbar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, this.item});
  final ProductModel? item;

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
          CustomCategoryFilter(),
        ],
      ),
    );
  }
}
