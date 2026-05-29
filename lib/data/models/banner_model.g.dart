// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerModelImpl _$$BannerModelImplFromJson(Map<String, dynamic> json) =>
    _$BannerModelImpl(
      id: json['id'] as String,
      title: json['title'] as String? ?? '',
      subtitle: json['subtitle'] as String? ?? '',
      imageUrl: json['imageUrl'] as String,
      linkType: json['linkType'] == null
          ? BannerLinkType.none
          : const BannerLinkTypeConverter().fromJson(json['linkType']),
      linkValue: json['linkValue'] as String? ?? '',
      sortOrder: (json['sortOrder'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? true,
      startsAt: const TimestampConverter().fromJson(json['startsAt']),
      endsAt: const TimestampConverter().fromJson(json['endsAt']),
    );

Map<String, dynamic> _$$BannerModelImplToJson(_$BannerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'linkType': const BannerLinkTypeConverter().toJson(instance.linkType),
      'linkValue': instance.linkValue,
      'sortOrder': instance.sortOrder,
      'isActive': instance.isActive,
      'startsAt': const TimestampConverter().toJson(instance.startsAt),
      'endsAt': const TimestampConverter().toJson(instance.endsAt),
    };
