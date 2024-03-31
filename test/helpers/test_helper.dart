import 'package:mockito/annotations.dart';
import 'package:clima_clean_bloc_tdd/domain/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
  [WeatherRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {
  // GetCurrentWeatherUseCase getCurrentWeatherUseCase;
}
