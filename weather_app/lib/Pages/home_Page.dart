// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit.dart';
import 'package:weather_app/Cubit/weather_stats.dart';
import 'package:weather_app/Pages/search_page.dart';

import '../Bodys/initial_home_page_body.dart';
import '../Bodys/success_home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(
              Icons.search,
              size: 34,
            ),
          )
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, stat) {
          if (stat is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (stat is WeatherSuccess) {
            return const SuccessHomePageBody();
          } else if (stat is WeatherFaliure) {
            return const Center(
                child: Text(
              'Something went wrong, try again.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ));
          } else {
            return const InitialHomePageBody();
          }
        },
      ),
    );
  }
}
