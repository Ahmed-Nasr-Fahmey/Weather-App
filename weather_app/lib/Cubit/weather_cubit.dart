import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_stats.dart';
import 'package:weather_app/Models/weather_model.dart';

import '../Services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitial());
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await WeatherServic().getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } catch (e) {
      emit(WeatherFaliure());
    }
  }
}
