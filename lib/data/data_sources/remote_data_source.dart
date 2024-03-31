import 'dart:convert';

import 'package:clima_clean_bloc_tdd/core/constants/constants.dart';
import 'package:clima_clean_bloc_tdd/core/error/exception.dart';
import 'package:clima_clean_bloc_tdd/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

/// `WeatherRemoteDataSource` is an abstract class that defines the contract for a weather data source.
abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

/// `WeatherRemoteDataSourceImpl` is a class that implements `WeatherRemoteDataSource`.
/// It uses the `http.Client` to fetch data from a remote server.
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  WeatherRemoteDataSourceImpl({required this.client});

  /// `getCurrentWeather` is a method that fetches the current weather for a given city.
  /// If the response status code is 200, it returns a `WeatherModel`.
  /// Otherwise, it throws a `ServerException`.
  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response = await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}