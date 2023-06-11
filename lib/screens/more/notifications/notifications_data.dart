class NotificationData {
  final String message;
  final String time;

  NotificationData({this.message, this.time});
}

class NotificationsData {
  static List<NotificationData> notifications = [
    NotificationData(
      message: "Your order has been placed",
      time: "1 day ago",
    ),
    NotificationData(
      message: "Your order has been canceled",
      time: "5 hours ago",
    ),
    NotificationData(
      message: "Payment successful",
      time: "3 days ago",
    ),
    NotificationData(
      message: "New offers available",
      time: "2 hours ago",
    ),
    NotificationData(
      message: "Your subscription has expired",
      time: "1 week ago",
    ),
    NotificationData(
      message: "Delivery on the way",
      time: "10 minutes ago",
    ),
    NotificationData(
      message: "Important update: Check your email",
      time: "2 months ago",
    ),
    NotificationData(
      message: "New message from support",
      time: "4 hours ago",
    ),
    NotificationData(
      message: "Order ready for pickup",
      time: "1 day ago",
    ),
    NotificationData(
      message: "Discount code: SAVE10",
      time: "2 weeks ago",
    ),
  ];
}
