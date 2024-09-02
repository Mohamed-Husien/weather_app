import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.checker});
  final String
      checker; //i create this var to make WeatherInfoBody doesn't require const when call it or use i tin another widget.
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        //to get gradien background
        colors: [
          getThemeColor(condition: weatherModel.conditionState),
          getThemeColor(condition: weatherModel.conditionState)[300]!,
          getThemeColor(condition: weatherModel.conditionState)[200]!,
          getThemeColor(condition: weatherModel.conditionState)[50]!,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Update at ${weatherModel.updatTime.hour}:${weatherModel.updatTime.minute}",
              // style: TextStyle(
              //   fontSize: 24,
              // ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weatherModel.image.contains('https:')
                      ? weatherModel.image
                      : 'https:${weatherModel.image}',
                  width: 100,
                  height: 100,
                ),
                Text(
                  '${weatherModel.avgTemp}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Max Temp ${weatherModel.maxTemp.round()}",
                    ),
                    Text(
                      "Min Temp ${weatherModel.minTemp.round()}",
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherModel.conditionState,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// String? getImage({required String condition}) {
//   if (condition.contains('clear')) {
//     return 'assets/images/clear.png';
//   } else if (condition.contains('cloudy')) {
//     return 'assets/images/cloudy.png';
//   } else if (condition.contains('rain')) {
//     return 'assets/images/rainy.png';
//   } else if (condition.contains('snow')) {
//     return 'assets/images/snow.png';
//   }
//   if (condition.contains('thunderstorm')) {
//     return 'assets/images/thunderstorm.png';
//   } else {
//     return 'assets/images/clear.png';
//   }
// }
