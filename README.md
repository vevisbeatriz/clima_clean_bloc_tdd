# clima_clean_bloc_tdd

This project serves as a demonstration of the application of Test-Driven Development (TDD), BLoC pattern, and Clean Architecture principles in a weather application. The primary focus of this project is on the architectural design, code structure, and the implementation of TDD, rather than the user interface.

## Table of Contents
- [Installation](#installation)
- [Usage](#usage)
- [App Functionality](#app-functionality)
- [Code and System Design](#code-and-system-design)
- [Clean Architecture Structure](#clean-architecture-structure)
- [Packages Used](#packages-used)
- [Use of BLoC](#use-of-bloc)
- [TDD](#tdd)

## Installation

This project uses Flutter. To install and run the project:

1. Clone the repo
2. Run `flutter pub get`
3. Run `flutter run`

## Usage

To use this application, run `flutter run` in the root directory. This will start the application in your default emulator.

## App Functionality

The application allows users to view the current weather for a specific city. The user enters the city name in a text field, and the application fetches and displays the weather information.

## Code and System Design

The codebase follows the principles of Clean Architecture and TDD. The project is divided into three layers: presentation, domain, and data. Each layer has its own responsibilities and they are loosely coupled.

## Clean Architecture Structure

The Clean Architecture structure divides the project into three layers: presentation, domain, and data. The presentation layer handles the UI and user interactions. The domain layer contains business logic and use cases. The data layer is responsible for fetching data from different sources.

## Packages Used

- `flutter_bloc`: This package is used for state management in the project. It helps to separate the presentation layer from the business logic, making the code more maintainable and testable.
- `dartz`: This package provides functional programming support in Dart. It is used in this project for handling failures and errors in a functional way, using concepts like Either and Option.
- `mockito`: This package is used for creating mock objects in tests. It provides a simple and flexible API for mocking and verifying the behavior of Dart classes.
- `http`: This package is used for making HTTP requests. It is used in this project to fetch weather data from an API.
- `equatable`: This package is used to simplify equality comparisons in Dart. It is used in this project to compare instances of entities and value objects.
- `get_it`: This package is used for dependency injection. It helps to manage and instantiate all the dependencies in the project.
- `flutter_test`: This package provides a set of testing utilities which are used to test widgets and services in Flutter.
- `bloc_test`: This package provides a set of testing utilities which are used to test BLoC state management in the project.
- 
## Use of BLoC

The BLoC (Business Logic Component) pattern is used for state management in this project. It separates the business logic from the presentation layer, making the code more maintainable and testable.

## TDD

Test-Driven Development (TDD) is a software development approach where tests are written before the actual code. This project follows the TDD approach, which helps in creating a robust and bug-free codebase.