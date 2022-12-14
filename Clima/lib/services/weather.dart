import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = 'add your api key';
const startURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    print('working');
    Networker Neworker = Networker('$startURL?q=$cityName&appid=$apiKey');
    var data = await Neworker.getData();
    print(data);
    print('got it');
    return data;
  }

  Future<dynamic> getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    double lat = location.getLatitude();
    print(lat);
    double long = location.getLongitude();
    print(long);

    Networker worker = Networker('$startURL?lat=$lat&lon=$long&appid=$apiKey');
    return await worker.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
