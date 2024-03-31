import 'package:clima_clean_bloc_tdd/core/error/failure.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';

/// Abstract class that defines the contract for a weather repository.
abstract class WeatherRepository {
  Future<Either<Failure,WeatherEntity>> getCurrentWeather(String cityName);
}