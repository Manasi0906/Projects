class Uploadpagemodal {
  final String productName;
  final String productAddress;
  final String productDiscription;
  final String quantity;
  final String price;
  final String harvestDate;
  final String expectShelf;
//  final String profileImage;
//  final List<String> additionalImages;

  Uploadpagemodal(
    Map<dynamic, dynamic> map, {
    required this.productName,
    required this.productAddress,
    required this.productDiscription,
    required this.quantity,
    required this.price,
    required this.harvestDate,
    required this.expectShelf,
    // required this.profileImage,
    // required this.additionalImages,
  });

  // List<String> get getAdditionalImages => additionalImages;
}
