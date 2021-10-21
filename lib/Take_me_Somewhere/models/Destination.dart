class Destination {
  final String title;
  final int id;
  final double latitude;
  final double longitude;
  final double rating;
  bool isSelected = false;

  Destination(this.title, this.id, this.latitude, this.longitude, this.rating);
  factory Destination.fromMap(Map<String, dynamic> json) {
    return Destination(
      json['title'] as String,
      json['id'] as int,
      json['latitude'] as double,
      json['longitude'] as double,
      json['rating'] as double,
    );
  }
}
