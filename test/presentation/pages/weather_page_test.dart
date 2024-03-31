import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart';
import 'package:clima_clean_bloc_tdd/presentation/bloc/weather_bloc.dart';
import 'package:clima_clean_bloc_tdd/presentation/bloc/weather_event.dart';
import 'package:clima_clean_bloc_tdd/presentation/bloc/weather_state.dart';
import 'package:clima_clean_bloc_tdd/presentation/pages/weather_page.dart';

// This test suite is for the WeatherPage class.
class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  late MockWeatherBloc mockWeatherBloc;

  setUp(() {
    mockWeatherBloc = MockWeatherBloc();
    HttpOverrides.global = null;
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<WeatherBloc>(
      create: (context) => mockWeatherBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  const testWeather = WeatherEntity(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  // This test verifies that the text field triggers a state change from empty to loading when a city name is entered.
  testWidgets(
    'text field should trigger state to change from empty to loading',
        (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherEmpty());

      //act
      await widgetTester.pumpWidget(_makeTestableWidget(const WeatherPage()));
      var textField = find.byType(TextField);
      expect(textField, findsOneWidget);
      await widgetTester.enterText(textField, 'New York');
      await widgetTester.pump();

      //assert
      expect(find.text('New York'), findsOneWidget);
    },
  );

  // This test verifies that a progress indicator is shown when the state is loading.
  testWidgets(
    'should show progress indicator when state is loading',
        (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state).thenReturn(WeatherLoading());

      //act
      await widgetTester.pumpWidget(_makeTestableWidget(const WeatherPage()));

      //assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  // This test verifies that a widget containing weather data is shown when the state is WeatherLoaded.
  testWidgets(
    'should show widget contain weather data when state is weather loaded',
        (widgetTester) async {
      //arrange
      when(() => mockWeatherBloc.state)
          .thenReturn(WeatherLoaded(testWeather));

      //act
      await widgetTester.pumpWidget(_makeTestableWidget(const WeatherPage()));
      await widgetTester.pumpAndSettle();

      //assert
      expect(find.byKey(const Key('weather_data')), findsOneWidget);
    },
  );
}