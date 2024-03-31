import 'package:clima_clean_bloc_tdd/core/error/failure.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import 'package:clima_clean_bloc_tdd/domain/repositories/weather_repository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository);

  Future<Either<Failure,WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}