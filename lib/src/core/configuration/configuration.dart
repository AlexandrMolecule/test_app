abstract class Configuration {
  static const host = 'https://api.openweathermap.org/'; //data/2.5/onecall; - weather, geo/1.0/direct' - geoposition
  static const apiKey = '4e7d27f35e59b0922a1116e6c2a684c1';
  static const geoPath = "geo/1.0/direct";
  static const weatherPath = "data/2.5/onecall";

}
// https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=hourly,minutely,alerts&appid=4e7d27f35e59b0922a1116e6c2a684c1&units=metric