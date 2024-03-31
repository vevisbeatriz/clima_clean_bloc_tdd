import 'dart:convert';

import 'package:clima_clean_bloc_tdd/data/models/weather_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main() {
  const testWeatherModel = WeatherModel(
    cityName: 'New York',
    main: 'Clear',
    description: 'clear sky',
    iconCode: '01d',
    temperature: 282.72,
    pressure: 1012,
    humidity: 51,
  );

  test('should be a subclass of weather entity', () async {
    // assert
    expect(testWeatherModel, isA<WeatherModel>());
  });

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
