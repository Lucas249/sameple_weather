import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum WeatherStatus { sunny, rainy, cloudy, normal }

extension WeatherStatusEx on WeatherStatus {
  static WeatherStatus? getType(String code) {
    switch (code) {
      case 'Clouds':
        return WeatherStatus.cloudy;
      case 'Clear':
        return WeatherStatus.sunny;
      case 'Rain':
        return WeatherStatus.rainy;
      default:
        return WeatherStatus.normal;
    }
  }
}

class WeatherHelper {
  WeatherHelper._();

  static Widget getWeatherType(String type) {
    final status = WeatherStatusEx.getType(type);
    switch (status) {
      case WeatherStatus.rainy:
        return Lottie.asset('assets/images/lottie/rain.json');
      case WeatherStatus.sunny:
        return Lottie.asset('assets/images/lottie/sun.json');
      case WeatherStatus.cloudy:
        return Lottie.asset('assets/images/lottie/cloud.json');
      default:
        return Lottie.asset('assets/images/lottie/normal.json');
    }
  }
}
