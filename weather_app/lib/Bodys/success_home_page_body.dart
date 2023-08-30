import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit.dart';

import '../Models/weather_model.dart';

class SuccessHomePageBody extends StatelessWidget {
  const SuccessHomePageBody({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
  final WeatherModel? weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.getThemeColor(),
            weatherData.getThemeColor()[400]!,
            weatherData.getThemeColor()[300]!,
            weatherData.getThemeColor()[200]!,
            weatherData.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 3,
          ),
          Text(
            BlocProvider.of<WeatherCubit>(context).cityName!,
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Updated at : ${weatherData.date.substring(weatherData.date.length - 5, weatherData.date.length)}',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(weatherData.getImage()),
              Text(
                '${weatherData.avgTemp.toInt()}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Max : ${weatherData.maxTemp.toInt()}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    'Min : ${weatherData.minTemp.toInt()}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            weatherData.weatherStateName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 7,
          ),
        ],
      ),
    );
  }
}
