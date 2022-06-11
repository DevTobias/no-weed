class ControlModel {
  final double temperature;
  final int moisture;
  final int lightLevel;
  final int waterLevel;
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;

  ControlModel({
    required this.temperature,
    required this.moisture,
    required this.lightLevel,
    required this.waterLevel,
    required this.startHour,
    required this.endHour,
    required this.startMinute,
    required this.endMinute,
  });

  ControlModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        moisture = json['moisture'],
        lightLevel = json['light_level'],
        waterLevel = json['water_level'],
        startHour = json['start_hour'],
        endHour = json['end_hour'],
        startMinute = json['start_minute'],
        endMinute = json['end_minute'];
}
