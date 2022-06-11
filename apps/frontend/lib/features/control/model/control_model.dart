class ControlModel {
  final double temperature;
  final int moisture;
  final int lightLevel;
  final int waterLevel;

  ControlModel({
    required this.temperature,
    required this.moisture,
    required this.lightLevel,
    required this.waterLevel,
  });

  ControlModel.fromJson(Map<String, dynamic> json)
      : temperature = json['temperature'],
        moisture = json['moisture'],
        lightLevel = json['light_level'],
        waterLevel = json['water_level'];
}
