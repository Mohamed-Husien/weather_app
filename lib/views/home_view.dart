import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_widget.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Weather App",
        ),

        // backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              )),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        //here i use this widget to mak my ui listen to cubit (integrate cubit)
        builder: (context, state) {
          if (state is InitialWeatherState) {
            return const NoWeahterBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              checker: state.weatherModel.cityName,
            );
          } else {
            return const Text("Oops , there is an errore ");
          }
        },
      ),
    );
  }
}
