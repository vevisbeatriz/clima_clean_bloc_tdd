import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:clima_clean_bloc_tdd/core/error/exception.dart';
import 'package:clima_clean_bloc_tdd/core/error/failure.dart';
import 'package:clima_clean_bloc_tdd/data/models/weather_model.dart';
import 'package:clima_clean_bloc_tdd/data/repositories/weather_repository_impl.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import '../../helpers/test_helper.mocks.dart';

/// This test suite is for the `WeatherRepositoryImpl` class.
void main() {
  late MockWeatherRemoteDataSource mockWeatherRemoteDataSource;
  late WeatherRepositoryImpl weatherRepositoryImpl;

  setUp(() {
    mockWeatherRemoteDataSource = MockWeatherRemoteDataSource();
    weatherRepositoryImpl = WeatherRepositoryImpl(
      weatherRemoteDataSource: mockWeatherRemoteDataSource,
    );
  });

  const testWeatherModel = WeatherModel(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const testWeatherEntity = WeatherEntity(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const testCityName = 'New York';

  group('get current weather', () {
    /// This test verifies that the `getCurrentWeather` method of `WeatherRepositoryImpl` returns a `Right` containing a `WeatherEntity` when the call to the data source is successful.
    test(
      'should return current weather when a call to data source is successful',
          () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenAnswer((_) async => testWeatherModel);

        // act
        final result =
        await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(result, equals(const Right(testWeatherEntity)));
      },
    );

    /// This test verifies that the `getCurrentWeather` method of `WeatherRepositoryImpl` returns a `Left` containing a `ServerFailure` when the call to the data source is unsuccessful.
    test(
      'should return server failure when a call to data source is unsuccessful',
          () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenThrow(ServerException());

        // act
        final result =
        await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(result, equals(Left(ServerFailure('An error has occurred'))));
      },
    );

    /// This test verifies that the `getCurrentWeather` method of `WeatherRepositoryImpl` returns a `Left` containing a `ConnectionFailure` when the device has no internet.
    test(
      'should return connection failure when the device has no internet',
          () async {
        // arrange
        when(mockWeatherRemoteDataSource.getCurrentWeather(testCityName))
            .thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final result =
        await weatherRepositoryImpl.getCurrentWeather(testCityName);

        // assert
        expect(
            result,
            equals(
                Left(ConnectionFailure('Failed to connect to the network'))));
      },
    );
  });
}