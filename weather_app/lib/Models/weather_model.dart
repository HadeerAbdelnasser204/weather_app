class Weather {
  final String cityName;
  final DateTime dateTime;
  final double temp;
  final String image;
  final double maxTemp;
  final double minTemp;
  final String description;

  Weather({
    required this.cityName,
    required this.dateTime,
    required this.temp,
    required this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.description,
  });
  // Add the following factory method to the Weather class:
  // This method will convert the JSON data into a Weather object.

  factory Weather.fromJson(json) {
    return Weather(
        cityName: json['location']['name'],
        dateTime: DateTime.parse(json['location']['localtime']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        description: json['forecast']['forecastday'][0]['day']['condition']
            ['text'],
        image: json['current']['condition']['icon']);
  }
}
