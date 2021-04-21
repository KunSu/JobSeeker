// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Application _$ApplicationFromJson(Map<String, dynamic> json) {
  return Application(
    boardID: json['board_id'] as String,
    companyaName: json['companya_name'] as String,
    createdDate: json['created_date'] == null
        ? null
        : DateTime.parse(json['created_date'] as String),
    description: json['description'] as String,
    id: json['id'] as String,
    jobTitle: json['job_title'] as String,
    location: json['location'] as String,
    status: json['status'] as String,
    uid: json['uid'] as String,
    updatedDate: json['updated_date'] == null
        ? null
        : DateTime.parse(json['updated_date'] as String),
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ApplicationToJson(Application instance) =>
    <String, dynamic>{
      'board_id': instance.boardID,
      'companya_name': instance.companyaName,
      'created_date': instance.createdDate?.toIso8601String(),
      'description': instance.description,
      'id': instance.id,
      'job_title': instance.jobTitle,
      'location': instance.location,
      'status': instance.status,
      'uid': instance.uid,
      'updated_date': instance.updatedDate?.toIso8601String(),
      'url': instance.url,
    };
