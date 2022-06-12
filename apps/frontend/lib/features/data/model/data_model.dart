class HumidityModel {
  final int value;
  final String date;

  HumidityModel({required this.value, required this.date});

  HumidityModel.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        date = json['date'];
}

class LightModel {
  final int value;
  final String date;

  LightModel({required this.value, required this.date});

  LightModel.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        date = json['date'];
}

class TemperatureModel {
  final double value;
  final String date;

  TemperatureModel({required this.value, required this.date});

  TemperatureModel.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        date = json['date'];
}

class DataModel {
  late final List<TemperatureModel> temperature;
  late final List<HumidityModel> humidity;
  late final List<LightModel> lightLevel;

  DataModel({
    required this.temperature,
    required this.humidity,
    required this.lightLevel,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    var temperatureList = json['temperature'] as List;
    List<TemperatureModel> temperature =
        temperatureList.map((temp) => TemperatureModel.fromJson(temp)).toList();

    var humidityList = json['humidity'] as List;
    List<HumidityModel> humidity =
        humidityList.map((hum) => HumidityModel.fromJson(hum)).toList();

    var lightList = json['light_level'] as List;
    List<LightModel> lightLevel =
        lightList.map((light) => LightModel.fromJson(light)).toList();

    this.temperature = temperature;
    this.humidity = humidity;
    this.lightLevel = lightLevel;
  }
}
