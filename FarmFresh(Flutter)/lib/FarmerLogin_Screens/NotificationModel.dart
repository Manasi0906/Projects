class NotificationModelFarmer {
  final String title;
  final String message;
  bool isSeen;

  NotificationModelFarmer({
    required this.title,
    required this.message,
    this.isSeen = false,
  });
}
