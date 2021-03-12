// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobBoard _$JobBoardFromJson(Map<String, dynamic> json) {
  return JobBoard(
    id: json['id'] as String,
    name: json['name'] as String,
    createdDate: json['createdDate'] as String,
  );
}

Map<String, dynamic> _$JobBoardToJson(JobBoard instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdDate': instance.createdDate,
    };
