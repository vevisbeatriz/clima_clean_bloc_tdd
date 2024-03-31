import 'package:clima_clean_bloc_tdd/core/error/failure.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import 'package:clima_clean_bloc_tdd/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

/// `GetCurrentWeatherUseCase` is a class that encapsulates the use case of fetching the current weather for a given city.
class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  /// `execute` is a method that fetches the current weather for a given city.
  /// It calls the `getCurrentWeather` method of `weatherRepository`.
  /// If the call is successful, it returns a `Right` with the `WeatherEntity`.
  /// If an error occurs, it returns a `Left` with a `Failure`.
  Future<Either<Failure,WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}