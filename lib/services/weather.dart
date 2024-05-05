import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = "2934751b36ebb6a0421e4079d675db50";

class WeatherModel {
  Future<dynamic> getCityWeather(String name) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            "https://api.openweathermap.org/geo/1.0/direct?"
                "q=$name&appid=$apiKey&units=metric");

    var cityWeatherData = await networkHelper.getData();

    return cityWeatherData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper nHelper = NetworkHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon"
            "=${location.longitude}&appid=$apiKey&units=metric");

    var weatherData = await nHelper.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time in';
    } else if (temp > 20) {
      return 'Time for shorts and 👕 in';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤 in';
    } else {
      return 'Bring a 🧥 just in case for';
    }
  }
}
