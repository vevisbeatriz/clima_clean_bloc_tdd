import 'package:clima_clean_bloc_tdd/core/error/failure.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherRepository {
  Future<Either<Failure,WeatherEntity>> getCurrentWeather(String cityName);
}