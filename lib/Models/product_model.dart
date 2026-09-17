class ProductModel {
  final String image;
  final String name;
  final String price;
  final List<String> colours;
  final List<String> sizes;
  final int favoritesCount;
  final String description;
  final String brand;
  final List<String> productDetails;
  final String sizeAndFit;

  ProductModel({
    required this.image,
    required this.name,
    required this.price,
    this.colours = const ['Black', 'White', 'Gray'],
    this.sizes = const ['S', 'M', 'L', 'XL'],
    this.favoritesCount = 0,
    this.description = '',
    this.brand = 'Generic',
    this.productDetails = const [],
    this.sizeAndFit = '',
  });
}
