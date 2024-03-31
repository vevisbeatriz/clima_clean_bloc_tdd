import 'dart:convert';

import 'package:clima_clean_bloc_tdd/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

/// This test suite is for the `WeatherModel` class.
void main() {
  /// `testWeatherModel` is a constant instance of `WeatherModel` that is used for testing.
  const testWeatherModel = WeatherModel(
    cityName: 'New York',
    main: 'Clear',
    description: 'clear sky',
    iconCode: '01d',
    temperature: 282.72,
    pressure: 1012,
    humidity: 51,
  );

  /// This test verifies that `WeatherModel` is a subclass of `WeatherEntity`.
  test('should be a subclass of weather entity', () async {
    // assert
    expect(testWeatherModel, isA<WeatherModel>());
  });

  /// This test verifies that the `fromJson` method of `WeatherModel` returns a valid model when given a JSON map.
  test('should return a valid model from json', () async {
    // arrange
    final Map<String, dynamic> jsonMap =
    json.decode(readJson('helpers/dummy_data/dummy_weather_response.json'));
    // act
    final result = WeatherModel.fromJson(jsonMap);
    // assert
    expect(result, equals(testWeatherModel));
  });
}