class Weather {
  double? temp;
  double? wind;
  String? cityName;
  int? humidity;
  double? feels_like;
  int? pressure;

  Weather(
      {this.temp,
      this.wind,
      this.cityName,
      this.humidity,
      this.feels_like,
      this.pressure});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temp: json['main']['temp'],
      wind: json['main']['speed'],
      humidity: json['main']['humidity'],
      feels_like: json['weather'][0]['feels_like'],
    );
  }
}
