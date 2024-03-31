import 'package:equatable/equatable.dart';

/// `WeatherEvent` is an abstract class that extends `Equatable`.
/// It represents the different types of events that can occur in the weather feature of the application.
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  /// The `props` getter is overridden from the `Equatable` class.
  /// It returns a list of the properties that should be considered when comparing instances of `WeatherEvent`.
  @override
  List<Object?> get props => [];
}

/// It represents the event of the city changing in the weather feature of the application.
class OnCityChanged extends WeatherEvent {
  final String cityName;

  const OnCityChanged(this.cityName);

  /// The `props` getter is overridden from the `Equatable` class.
  /// It returns a list of the properties that should be considered when comparing instances of `OnCityChanged`.
  /// In this case, the `cityName` is the only property that is considered.
  @override
  List<Object?> get props => [cityName];
}