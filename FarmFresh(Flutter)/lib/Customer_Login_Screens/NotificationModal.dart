class NotificationModelCustomer {
  final String title;
  final String message;
  bool isSeen;

  NotificationModelCustomer({
    required this.title,
    required this.message,
    this.isSeen = false,
  });
}
