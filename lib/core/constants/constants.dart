class Urls {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const String apiKey = '40cfe72eb26fa8c49c9fbb1c28d87d81';

  static String currentWeatherByName(String city) =>
      '$baseUrl/weather?q=$city&appid=$apiKey';

  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
}
