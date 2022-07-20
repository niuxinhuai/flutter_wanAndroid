// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarWrap _$CalendarWrapFromJson(Map json) => CalendarWrap()
  ..code = json['code'] as int?
  ..holiday = (json['holiday'] as Map?)?.map(
    (k, e) => MapEntry(k as String,
        CalendarItem.fromJson(Map<String, dynamic>.from(e as Map))),
  );

Map<String, dynamic> _$CalendarWrapToJson(CalendarWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'holiday': instance.holiday,
    };

CalendarItem _$CalendarItemFromJson(Map json) => CalendarItem()
  ..holiday = json['holiday'] as bool?
  ..name = json['name'] as String?
  ..after = json['after'] as bool?
  ..wage = json['wage'] as int?
  ..target = json['target'] as String?
  ..date = json['date'] as String?
  ..rest = json['rest'] as int?;

Map<String, dynamic> _$CalendarItemToJson(CalendarItem instance) =>
    <String, dynamic>{
      'holiday': instance.holiday,
      'name': instance.name,
      'after': instance.after,
      'wage': instance.wage,
      'target': instance.target,
      'date': instance.date,
      'rest': instance.rest,
    };
