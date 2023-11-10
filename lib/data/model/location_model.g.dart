// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LocationDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

LocationDetail _$LocationDetailFromJson(Map<String, dynamic> json) =>
    LocationDetail(
      id: json['id'] as int?,
      wikiDataId: json['wikiDataId'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
      region: json['region'] as String?,
      regionCode: json['regionCode'] as String?,
      regionWdId: json['regionWdId'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      population: json['population'] as int?,
    );

Map<String, dynamic> _$LocationDetailToJson(LocationDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wikiDataId': instance.wikiDataId,
      'type': instance.type,
      'name': instance.name,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'region': instance.region,
      'regionCode': instance.regionCode,
      'regionWdId': instance.regionWdId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'population': instance.population,
    };
