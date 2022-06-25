class FCMPushNotification {
  String title;
  String body;

  FCMPushNotification({
    required this.title,
    required this.body
  });

  factory FCMPushNotification.fromJson(Map<String, dynamic> json) {
    return FCMPushNotification(
        title: json['title'],
        body: json['body']
    );
  }
}