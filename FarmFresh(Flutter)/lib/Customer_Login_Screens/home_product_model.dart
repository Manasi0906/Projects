class HomeProduct {
  final String? image;
  final String proName;
  final String? measureUnit;
  double proPrice;
  final int? days;

  final double? rating;
  final String? productDescrip;
  final String? farmerName;
  final List? productImages;
  final String? category;
  final String? harvestDate;
  final String? shelfLife;
  final String? quantityAvailable;
  final bool isBasketItem;

  HomeProduct(
      {this.image = "assets/fruits/apple.jpg",
      required this.proName,
      this.measureUnit = "kg",
      required this.proPrice,
      this.days = 3,
      this.rating = 4.5,
      this.productDescrip,
      this.farmerName,
      this.productImages = const [
        "assets/fruits/apple.jpg",
        "assets/fruits/apple.jpg",
        "assets/fruits/apple.jpg"
      ],
      this.category,
      this.harvestDate,
      this.shelfLife,
      this.quantityAvailable,
      this.isBasketItem=false});
}
