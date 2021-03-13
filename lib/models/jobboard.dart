import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jobboard.g.dart';

@JsonSerializable()
class JobBoard {
  JobBoard({
    @required this.id,
    @required this.name,
    @required this.createdDate,
  });

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory JobBoard.fromJson(Map<String, dynamic> json) =>
      _$JobBoardFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$JobBoardToJson`.
  Map<String, dynamic> toJson() => _$JobBoardToJson(this);

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  @JsonKey(required: true)
  final String name;

  @JsonKey(name: 'createdDate')
  @JsonKey(required: true)
  final String createdDate;
}
