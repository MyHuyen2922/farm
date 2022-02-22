class Weather {
  double? temp;
  double? wind;
  String? cityName;
  int? humidity;
  double? feels_like;
  int? pressure;
  double? lat;
  double? lng;

  Weather(
      {this.temp,
      this.wind,
      this.cityName,
      this.humidity,
      this.feels_like,
      this.pressure,
      this.lat,
      this.lng,
      });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      lat: json['lat'],
      lng: json['lon'],
      temp: json['current']['temp'],
    );
  }
}
