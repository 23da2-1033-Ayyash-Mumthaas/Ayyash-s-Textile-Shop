// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
  Map<String, dynamic> json,
) => _$NotificationModelImpl(
  id: json['id'] as String,
  userId: json['userId'] as String,
  title: json['title'] as String? ?? '',
  body: json['body'] as String? ?? '',
  type: json['type'] as String? ?? 'general',
  data: json['data'] as Map<String, dynamic>? ?? const {},
  isRead: json['isRead'] as bool? ?? false,
  createdAt: const TimestampConverter().fromJson(json['createdAt']),
);

Map<String, dynamic> _$$NotificationModelImplToJson(
  _$NotificationModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'title': instance.title,
  'body': instance.body,
  'type': instance.type,
  'data': instance.data,
  'isRead': instance.isRead,
  'createdAt': const TimestampConverter().toJson(instance.createdAt),
};
