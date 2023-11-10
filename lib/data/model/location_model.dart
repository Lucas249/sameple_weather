import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  LocationModel({
    required this.data,
  });

  final List<LocationDetail>? data;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

@JsonSerializable()
class LocationDetail {
  LocationDetail({
    required this.id,
    required this.wikiDataId,
    required this.type,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionCode,
    required this.regionWdId,
    required this.latitude,
    required this.longitude,
    required this.population,
  });

  final int? id;
  final String? wikiDataId;
  final String? type;
  final String? name;
  final String? country;
  final String? countryCode;
  final String? region;
  final String? regionCode;
  final String? regionWdId;
  final double? latitude;
  final double? longitude;
  final int? population;

  factory LocationDetail.fromJson(Map<String, dynamic> json) => _$LocationDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDetailToJson(this);
}
