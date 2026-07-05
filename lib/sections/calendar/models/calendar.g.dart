// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarWrap _$CalendarWrapFromJson(Map<String, dynamic> json) => CalendarWrap()
  ..code = (json['code'] as num?)?.toInt()
  ..holiday = (json['holiday'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, CalendarItem.fromJson(e as Map<String, dynamic>)),
  );

Map<String, dynamic> _$CalendarWrapToJson(CalendarWrap instance) =>
    <String, dynamic>{
      'code': instance.code,
      'holiday': instance.holiday,
    };

CalendarItem _$CalendarItemFromJson(Map<String, dynamic> json) => CalendarItem()
  ..holiday = json['holiday'] as bool?
  ..name = json['name'] as String?
  ..after = json['after'] as bool?
  ..wage = (json['wage'] as num?)?.toInt()
  ..target = json['target'] as String?
  ..date = json['date'] as String?
  ..rest = (json['rest'] as num?)?.toInt();

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
