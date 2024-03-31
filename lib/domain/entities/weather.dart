import 'package:equatable/equatable.dart';

/// Data model that represents weather data in the application. It extends the Equatable class, which allows instances of WeatherEntity to be compared based on their values rather than their references.
class WeatherEntity extends Equatable{
  const WeatherEntity({
    required this.cityName,
    required this.main,
    required this.description,
    required this.iconCode,
    required this.temperature,
    required this.pressure,
    required this.humidity,
  });

  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final int pressure;
  final int humidity;

  @override
  List<Object?> get props => [
    cityName,
    main,
    description,
    iconCode,
    temperature,
    pressure,
    humidity,
  ];
}