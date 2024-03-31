import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clima_clean_bloc_tdd/domain/usecases/get_current_weather.dart';
import 'package:clima_clean_bloc_tdd/presentation/bloc/weather_event.dart';
import 'package:clima_clean_bloc_tdd/presentation/bloc/weather_state.dart';
import 'package:rxdart/rxdart.dart';

/// `WeatherBloc` is a class that extends `Bloc` and manages the state of the weather feature in the application.
class WeatherBloc extends Bloc<WeatherEvent,WeatherState> {

  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  WeatherBloc(this._getCurrentWeatherUseCase) : super(WeatherEmpty()) {
    on<OnCityChanged>(
          (event, emit) async {

        /// When the city changes, it emits a `WeatherLoading` state, fetches the current weather for the new city,
        /// and then emits either a `WeatherLoaded` state with the fetched weather data or a `WeatherLoadFailure` state with the error message.
        emit(WeatherLoading());
        final result = await _getCurrentWeatherUseCase.execute(event.cityName);
        result.fold(
              (failure) {
            emit(WeatherLoadFailure(failure.message));
          },
              (data) {
            emit(WeatherLoaded(data));
          },
        );
      },
      /// The `debounce` transformer is used to delay the execution of the event handler until a certain duration has passed without any new events.
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

/// `debounce` is a function that creates an `EventTransformer`.
/// The created transformer delays the execution of the event handler until a certain duration has passed without any new events.
EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}