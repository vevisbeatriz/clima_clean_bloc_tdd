import 'package:clima_clean_bloc_tdd/data/data_sources/remote_data_source.dart';
import 'package:clima_clean_bloc_tdd/domain/usecases/get_current_weather.dart';
import 'package:mockito/annotations.dart';
import 'package:clima_clean_bloc_tdd/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;

// This function generates mocks for WeatherRepository, WeatherRemoteDataSource, GetCurrentWeatherUseCase, and http.Client.
@GenerateMocks(
  [
    WeatherRepository,
    WeatherRemoteDataSource,
    GetCurrentWeatherUseCase,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {
  // GetCurrentWeatherUseCase getCurrentWeatherUseCase;
}
