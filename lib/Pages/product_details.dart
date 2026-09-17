import 'package:fashion_store_app/Models/product_model.dart';
import 'package:fashion_store_app/data/product_data.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../Widgets/Custom_category_filter.dart';
import '../Widgets/Custom_text.dart';
import '../Widgets/custom_appbar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();
  final double _minExtent = 0.35;
  final double _maxExtent = 0.9;

  @override
  void dispose() {
    _sheetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final recommendedProducts =
        products.where((p) => p.name != widget.product.name).toList();

    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Men',
        prefix: 'assets/svgs/arrow-left.svg',
        suffix: 'assets/svgs/cart.svg',
      ),
      body: Stack(
        children: [
          // Background content (Image) - Optimized with AnimatedBuilder to avoid full setState on drag
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * _minExtent,
            child: Column(
              children: [
                const CustomCategoryFilter(),
                Expanded(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _sheetController,
                      builder: (context, child) {
                        final currentExtent = _sheetController.isAttached
                            ? _sheetController.size
                            : 0.4;
                        // Calculate scale and position based on sheet extent
                        double scale = 1.0 -
                            ((currentExtent - _minExtent) /
                                    (_maxExtent - _minExtent)) *
                                0.4;
                        double verticalOffset =
                            ((currentExtent - _minExtent) /
                                    (_maxExtent - _minExtent)) *
                                -100;

                        return Transform.translate(
                          offset: Offset(0, verticalOffset),
                          child: Transform.scale(
                            scale: scale,
                            child: child,
                          ),
                        );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            widget.product.image,
                            fit: BoxFit.contain,
                            cacheWidth: 800, // Main image is large
                          ),
                          Positioned(
                            bottom: 20,
                            child: Image.asset(
                              'assets/images/shadow.png',
                              width: 250,
                              cacheWidth: 400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Persistent Bottom Sheet
          DraggableScrollableSheet(
            controller: _sheetController,
            initialChildSize: 0.4,
            minChildSize: _minExtent,
            maxChildSize: _maxExtent,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                  children: [
                    // Handle bar
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    // Title and Price Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: widget.product.name,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.favorite_border, size: 24),
                            const Gap(4),
                            CustomText(
                              text: widget.product.favoritesCount.toString(),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(8),
                    CustomText(
                      text: widget.product.price,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                    const Gap(20),

                    // Color and Size Selectors
                    _buildSelectionRow(
                        "Select colour", widget.product.colours.first),
                    const Gap(12),
                    _buildSelectionRow(
                        "Select size", widget.product.sizes.first),
                    const Gap(24),

                    // Add to Bag Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff131313),
                        minimumSize: const Size(double.infinity, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const CustomText(
                        text: "ADD TO BAG",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(24),

                    // Delivery and Returns
                    _buildInfoRow(Icons.local_shipping_outlined,
                        "Free delivery", "on orders over £50"),
                    const Gap(12),
                    _buildInfoRow(Icons.replay_outlined, "Free return",
                        "View return policy",
                        isLink: true),
                    const Gap(24),

                    // Expandable Details
                    _buildExpansionTile("About product", widget.product.description),
                    _buildExpansionTile("Product details", widget.product.productDetails.join("\n")),
                    _buildExpansionTile("Brand", widget.product.brand),
                    _buildExpansionTile("Size and fit", widget.product.sizeAndFit),
                    _buildExpansionTile("History", "A classic addition to your wardrobe with a history of quality."),

                    const Gap(32),

                    // "You might also like"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomText(
                          text: "You might also like",
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View all",
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Gap(16),
                    SizedBox(
                      height: 180,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: recommendedProducts.length,
                        addRepaintBoundaries: true,
                        separatorBuilder: (_, __) => const Gap(12),
                        itemBuilder: (context, index) {
                          final p = recommendedProducts[index];
                          return _buildRecommendationItem(context, p);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSelectionRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: label,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
        Row(
          children: [
            CustomText(
              text: value,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            const Gap(4),
            const Icon(Icons.keyboard_arrow_down, size: 20),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String subtitle,
      {bool isLink = false}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 20, color: Colors.black87),
        ),
        const Gap(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            GestureDetector(
              onTap: isLink ? () {} : null,
              child: CustomText(
                text: subtitle,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isLink ? Colors.blueAccent : Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExpansionTile(String title, String content) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: CustomText(
          text: title,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        tilePadding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              content,
              style: const TextStyle(color: Colors.black54, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(BuildContext context, ProductModel product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => ProductDetails(product: product),
          ),
        );
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: const Color(0xffECECEC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                  cacheWidth: 200, // Small thumbnails
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: product.price,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
