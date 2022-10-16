// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OderLocation {
  double latitude;
  double longitutde;
  DateTime dateTime;
  OderLocation({
    required this.latitude,
    required this.longitutde,
    required this.dateTime,
  });

  OderLocation copyWith({
    double? latitude,
    double? longitutde,
    DateTime? dateTime,
  }) {
    return OderLocation(
      latitude: latitude ?? this.latitude,
      longitutde: longitutde ?? this.longitutde,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'latitude': latitude,
      'longitutde': longitutde,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory OderLocation.fromMap(Map<String, dynamic> map) {
    return OderLocation(
      latitude: map['latitude'] as double,
      longitutde: map['longitutde'] as double,
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory OderLocation.fromJson(String source) =>
      OderLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OderLocation(latitude: $latitude, longitutde: $longitutde, dateTime: $dateTime)';

  @override
  bool operator ==(covariant OderLocation other) {
    if (identical(this, other)) return true;

    return other.latitude == latitude &&
        other.longitutde == longitutde &&
        other.dateTime == dateTime;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitutde.hashCode ^ dateTime.hashCode;
}
