import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

@JsonSerializable()
class Application {
  Application({
    @required this.boardID,
    @required this.companyaName,
    @required this.createdDate,
    this.description,
    this.id,
    this.jobTitle,
    this.location,
    @required this.status,
    @required this.uid,
    @required this.updatedDate,
    this.url,
  });

  factory Application.fromJson(Map<String, dynamic> json) =>
      _$ApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$ApplicationToJson(this);

  @JsonKey(name: 'board_id')
  @JsonKey(required: true)
  final String boardID;

  @JsonKey(name: 'companya_name')
  @JsonKey(required: true)
  final String companyaName;

  @JsonKey(name: 'created_date')
  @JsonKey(required: true)
  final DateTime createdDate;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'job_title')
  final String jobTitle;

  @JsonKey(name: 'location')
  final String location;

  @JsonKey(name: 'status')
  @JsonKey(required: true)
  final String status;

  @JsonKey(name: 'uid')
  @JsonKey(required: true)
  final String uid;

  @JsonKey(name: 'updated_date')
  @JsonKey(required: true)
  final DateTime updatedDate;

  @JsonKey(name: 'url')
  final String url;
}
