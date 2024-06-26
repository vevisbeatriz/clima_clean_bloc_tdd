import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';

/// Data model that extends the WeatherEntity class. It is used to represent weather data in the application.
class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required String cityName,
    required String main,
    required String description,
    required String iconCode,
    required double temperature,
    required int pressure,
    required int humidity,
  }) : super(
          cityName: cityName,
          main: main,
          description: description,
          iconCode: iconCode,
          temperature: temperature,
          pressure: pressure,
          humidity: humidity,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'].toDouble(),
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
      );

  WeatherEntity toEntity() => WeatherEntity(
    cityName: cityName,
    main: main,
    description: description,
    iconCode: iconCode,
    temperature: temperature,
    pressure: pressure,
    humidity: humidity,
  );
}
