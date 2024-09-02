import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  // here i create cubit
  WeatherModel? weatherModel;
  GetWeatherCubit()
      : super(InitialWeatherState()); //that is the initial state of our app
  getWeather({required String cityName}) async {
    //method to deal with my logic
    try {
      weatherModel = await WeatherService(
              Dio()) // here i put me logic that is responsable to make change in me app
          .getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(
          weatherModel:
              weatherModel!)); //here i send weather loaded done successfully
    } catch (e) {
      emit(
          WeatherFailureState()); // here the emit send that Weather failure to loaded
    }
  }
}
