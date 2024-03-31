import 'dart:io';
import 'package:clima_clean_bloc_tdd/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:clima_clean_bloc_tdd/data/data_sources/remote_data_source.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import 'package:clima_clean_bloc_tdd/domain/repositories/weather_repository.dart';

import '../../core/error/exception.dart';

class WeatherRepositoryImpl extends WeatherRepository {

  final WeatherRemoteDataSource weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});

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