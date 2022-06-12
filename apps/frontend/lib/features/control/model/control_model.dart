class ControlModel {
  final double temperature;
  final int humidity;
  final int lightLevel;
  final int waterLevel;
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;
  final bool lightOn;

  ControlModel({
    required this.temperature,
    required this.humidity,
    required this.lightLevel,
    required this.waterLevel,
    required this.startHour,
    required this.endHour,
    required this.startMinute,
    required this.endMinute,
    required this.lightOn,
  });

  ControlModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        humidity = json['humidity'],
        lightLevel = json['light_level'],
        waterLevel = json['water_level'],
        startHour = json['start_hour'],
        endHour = json['end_hour'],
        startMinute = json['start_minute'],
        endMinute = json['end_minute'],
        lightOn = json['light_on'];
}
