import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Location {
  Location({
    @required this.lat,
    @required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  final double lat;
  final double lng;
}

@JsonSerializable()
class Geometry {
  Geometry({
    @required this.location,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);

  final Location location;
}

@JsonSerializable()
class Result {
  Result({
    @required this.geometry,
    @required this.name,
    @required this.rating,
    @required this.vicinity,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);

  final Geometry geometry;
  final String name;
  final double rating;
  final String vicinity;
}
