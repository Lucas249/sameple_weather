import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';

class DioClient {
  final Dio _dio = Dio();

  final weatherBaseUrl = 'https://api.openweathermap.org';
  final locationBaseUrl = 'http://geodb-free-service.wirefreethought.com';
  final weatherKey = '30be80fefdca27d35d3927dcae418399';

  Future<LocationModel?> getLocation(String inputLocation) async {
    LocationModel? locationModel;
    try {
      Response response = await _dio
          .get('$locationBaseUrl/v1/geo/places?namePrefix=$inputLocation&hateoasMode=false&limit=5&offset=0');
      locationModel = LocationModel.fromJson(response.data);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return locationModel;
  }

  Future<WeatherModel?> getWeather(double lat, double lon) async {
    WeatherModel? weatherModel;
    try {
      Response response = await _dio.get('$weatherBaseUrl/data/2.5/weather?lat=$lat&lon=$lon&appid=$weatherKey');
      weatherModel = WeatherModel.fromJson(response.data);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    return weatherModel;
  }
}
