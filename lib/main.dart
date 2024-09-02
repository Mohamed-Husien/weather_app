import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  return runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetWeatherCubit(), //here i provid cubit to my app specifically to Home view and Search View  (provide cubit)
      child: Builder(
        // to give context to Material
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          //integrate getWeatherCubit to make theme of the changes when weather info is updated.
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  condition: BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.conditionState,
                ),
                // brightness: Brightness.dark,
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor({required String? condition}) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case "sunny":
    // return Colors.blue;
    case "clear":
      return Colors.orange;
    case "partly cloudy":
      return Colors.grey;
    case "cloudy":
      return Colors.grey;
    case "overcast":
      return Colors.grey;
    case "mist":
      return Colors.grey;
    case "patchy rain possible":
      return Colors.lightBlue;
    case "patchy snow possible":
    case "patchy sleet possible":
      return Colors.grey;
    case "patchy freezing drizzle possible":
      return Colors.grey;
    case "thundery outbreaks possible":
      return Colors.yellow;
    case "blowing snow":
    case "blizzard":
    case "fog":
      return Colors.grey;
    case "freezing fog":
      return Colors.grey;
    case "patchy light drizzle":
      return Colors.lightBlue;
    case "light drizzle":
      return Colors.lightBlue;
    case "freezing drizzle":
      return Colors.lightBlue;
    case "heavy freezing drizzle":
      return Colors.lightBlue;
    case "patchy light rain":
      return Colors.lightBlue;
    case "light rain":
      return Colors.lightBlue;
    case "moderate rain at times":
      return Colors.lightBlue;
    case "moderate rain":
      return Colors.lightBlue;
    case "heavy rain at times":
      return Colors.lightBlue;
    case "heavy rain":
      return Colors.lightBlue;
    case "light freezing rain":
      return Colors.lightBlue;
    case "moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "light sleet":
    case "moderate or heavy sleet":
    case "patchy light snow":
    case "light snow":
    case "patchy moderate snow":
    case "moderate snow":
    case "patchy heavy snow":
    case "heavy snow":
    case "ice pellets":
      return Colors.grey;
    case "light rain shower":
      return Colors.lightBlue;
    case "moderate or heavy rain shower":
      return Colors.lightBlue;
    case "torrential rain shower":
      return Colors.lightBlue;
    case "light sleet showers":
    case "moderate or heavy sleet showers":
    case "light snow showers":
    case "moderate or heavy snow showers":
    case "light showers of ice pellets":
      return Colors.grey;
    case "moderate or heavy showers of ice pellets":
      return Colors.grey;
    case "patchy light rain with thunder":
      return Colors.yellow;
    case "moderate or heavy rain with thunder":
      return Colors.yellow;
    case "patchy light snow with thunder":
    case "moderate or heavy snow with thunder":
    default:
      return Colors.blue; // Default color for unknown conditions
  }
}
