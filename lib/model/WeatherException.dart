class WeatherException {
  String? message;

  WeatherException({this.message});

  factory WeatherException.checkStatus(int code) {
    switch (code) {
      case 404:
       return WeatherException(message: 'File Not Found');

      case 401:
        return WeatherException(message: 'Unauthorized');

      case 500:
        return WeatherException(message: 'Internal Server Error');

      default:
        return WeatherException();
    }
  }
}
