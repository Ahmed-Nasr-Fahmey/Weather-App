import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search a City',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 16,
                ),
                hintText: 'Enter a City',
                border: const OutlineInputBorder(),
                suffixIcon: GestureDetector(
                    onTap: () {
                      BlocProvider.of<WeatherCubit>(context)
                          .getWeather(cityName: cityName!);
                      BlocProvider.of<WeatherCubit>(context).cityName =
                          cityName;
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.search)),
                label: const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
