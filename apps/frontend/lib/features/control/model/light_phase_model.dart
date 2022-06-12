class LightPhaseModel {
  final int startHour;
  final int startMinute;
  final int endHour;
  final int endMinute;

  LightPhaseModel({
    required this.startHour,
    required this.endHour,
    required this.startMinute,
    required this.endMinute,
  });

  LightPhaseModel.fromJson(Map<String, dynamic> json)
      : startHour = json['start_hour'],
        endHour = json['end_hour'],
        startMinute = json['start_minute'],
        endMinute = json['end_minute'];

  @override
  LightPhaseModel copyWith({
    int? startHour,
    int? endHour,
    int? startMinute,
    int? endMinute,
  }) {
    return LightPhaseModel(
      startHour: startHour ?? this.startHour,
      endHour: endHour ?? this.endHour,
      startMinute: startMinute ?? this.startMinute,
      endMinute: endMinute ?? this.endMinute,
    );
  }
}
