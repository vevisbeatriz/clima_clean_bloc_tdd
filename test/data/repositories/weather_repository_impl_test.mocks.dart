// Mocks generated by Mockito 5.4.4 from annotations
// in clima_clean_bloc_tdd/test/data/repositories/weather_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:clima_clean_bloc_tdd/core/error/failure.dart' as _i6;
import 'package:clima_clean_bloc_tdd/data/data_sources/remote_data_source.dart'
    as _i8;
import 'package:clima_clean_bloc_tdd/data/models/weather_model.dart' as _i3;
import 'package:clima_clean_bloc_tdd/domain/entities/weather.dart' as _i7;
import 'package:clima_clean_bloc_tdd/domain/repositories/weather_repository.dart'
    as _i4;
import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeatherModel_1 extends _i1.SmartFake implements _i3.WeatherModel {
  _FakeWeatherModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WeatherRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRepository extends _i1.Mock implements _i4.WeatherRepository {
  MockWeatherRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.WeatherEntity>> getCurrentWeather(
          String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [cityName],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, _i7.WeatherEntity>>.value(
                _FakeEither_0<_i6.Failure, _i7.WeatherEntity>(
          this,
          Invocation.method(
            #getCurrentWeather,
            [cityName],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.WeatherEntity>>);
}

/// A class which mocks [WeatherRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWeatherRemoteDataSource extends _i1.Mock
    implements _i8.WeatherRemoteDataSource {
  MockWeatherRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.WeatherModel> getCurrentWeather(String? cityName) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCurrentWeather,
          [cityName],
        ),
        returnValue: _i5.Future<_i3.WeatherModel>.value(_FakeWeatherModel_1(
          this,
          Invocation.method(
            #getCurrentWeather,
            [cityName],
          ),
        )),
      ) as _i5.Future<_i3.WeatherModel>);
}
