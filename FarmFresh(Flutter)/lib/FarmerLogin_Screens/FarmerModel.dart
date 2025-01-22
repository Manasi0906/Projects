class Farmermodel {
  String url;
  String name;
  String address;
  DateTime datetime;
  int orderNo;
  int qty;
  double amount;
  String? profileimage;

  Farmermodel({
    required this.url,
    required this.name,
    required this.address,
    required this.datetime,
    required this.orderNo,
    required this.qty,
    required this.amount,
    this.profileimage = "assets/fruits/apple.jpg",
  });
}
