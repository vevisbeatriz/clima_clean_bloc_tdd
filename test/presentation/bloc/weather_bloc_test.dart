import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:clima_clean_bloc_tdd/core/error/failure.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import 'package:clima_clean_bloc_tdd/presentation/bloc/weather_bloc.dart';
import 'package:clima_clean_bloc_tdd/presentation/bloc/weather_event.dart';
import 'package:clima_clean_bloc_tdd/presentation/bloc/weather_state.dart';

import '../../helpers/test_helper.mocks.dart';

// This test suite is for the WeatherBloc class.
void main() {

  late MockGetCurrentWeatherUseCase mockGetCurrentWeatherUseCase;
  late WeatherBloc weatherBloc;

  setUp(() {
    mockGetCurrentWeatherUseCase = MockGetCurrentWeatherUseCase();
    weatherBloc = WeatherBloc(mockGetCurrentWeatherUseCase);
  });

  const testWeather = WeatherEntity(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const testCityName = 'New York';

  // This test verifies that the initial state of the WeatherBloc is WeatherEmpty.
  test(
      'initial state should be empty',
          () {
        expect(weatherBloc.state, WeatherEmpty());
      }
  );

  // This test verifies that the WeatherBloc emits the correct states when it successfully retrieves weather data.
  blocTest<WeatherBloc,WeatherState>(
      'should emit [WeatherLoading, WeatherLoaded] when data is gotten successfully',
      build: () {
        when(
            mockGetCurrentWeatherUseCase.execute(testCityName)
        ).thenAnswer((_) async => const Right(testWeather));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const OnCityChanged(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        WeatherLoading(),
        const WeatherLoaded(testWeather)
      ]
  );

  // This test verifies that the WeatherBloc emits the correct states when it fails to retrieve weather data.
  blocTest<WeatherBloc,WeatherState>(
      'should emit [WeatherLoading, WeatherLoadFailure] when get data is unsuccessful',
      build: () {
        when(
            mockGetCurrentWeatherUseCase.execute(testCityName)
        ).thenAnswer((_) async => Left(ServerFailure('Server failure')));
        return weatherBloc;
      },
      act: (bloc) => bloc.add(const OnCityChanged(testCityName)),
      wait: const Duration(milliseconds: 500),
      expect: () => [
        WeatherLoading(),
        const WeatherLoadFailure('Server failure'),
      ]
  );
}