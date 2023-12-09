// ignore_for_file: public_member_api_docs, sort_constructors_first
/// The response of the `GET /api/activity` endpoint.
class Activity {
  final String key;
  final String activity;
  final String type;
  final String link;
  final int participants;
  final double price;

  Activity({
    required this.key,
    required this.activity,
    required this.type,
    required this.link,
    required this.participants,
    required this.price,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      key: json['key'] as String,
      activity: json['activity'] as String,
      link: json['link'] as String,
      type: json['type'] as String,
      participants: json['participants'] as int,
      price: json['price'] is int ? (json['price'] as int).toDouble() : json['price'] as double,
    );
  }

}
