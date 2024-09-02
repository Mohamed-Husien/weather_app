class WeatherModel {
  final String cityName;
  final DateTime updatTime;
  final String image;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final String conditionState;

  WeatherModel(
      {required this.cityName,
      required this.updatTime,
      required this.image,
      required this.maxTemp,
      required this.minTemp,
      required this.avgTemp,
      required this.conditionState});

  factory WeatherModel.formJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      updatTime: DateTime.parse(json['location']['localtime']),
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      conditionState: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
