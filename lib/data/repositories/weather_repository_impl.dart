import 'dart:io';
import 'package:clima_clean_bloc_tdd/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:clima_clean_bloc_tdd/data/data_sources/remote_data_source.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import 'package:clima_clean_bloc_tdd/domain/repositories/weather_repository.dart';
import 'package:clima_clean_bloc_tdd/core/error/exception.dart';

/// `WeatherRepositoryImpl` is a class that implements `WeatherRepository`.
/// It uses `WeatherRemoteDataSource` to fetch weather data from a remote server.
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

  /// `getCurrentWeather` is a method that fetches the current weather for a given city.
  /// It calls the `getCurrentWeather` method of `weatherRemoteDataSource` and handles exceptions.
  /// If the call is successful, it returns a `Right` with the `WeatherEntity`.
  /// If a `ServerException` occurs, it returns a `Left` with a `ServerFailure`.
  /// If a `SocketException` occurs, it returns a `Left` with a `ConnectionFailure`.
  @override
  Future < Either < Failure, WeatherEntity >> getCurrentWeather(String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}