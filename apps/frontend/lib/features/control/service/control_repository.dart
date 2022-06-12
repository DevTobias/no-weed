import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/features/control/model/control_model.dart';

class ControlRepoistory {
  static Future<ControlModel?> getControlData() async {
    final glasshouseId = "dc7521a9-c17c-4194-8ba3-eae27f99be34";
    final uri = Uri.parse('http://localhost:8080/v1/control/$glasshouseId');
    final req = await http.get(uri);

    if (req.statusCode != 200) return null;

    return ControlModel.fromJson(json.decode(req.body));
  }

  static Future<void> persistLightMode(bool mode) async {
    final glasshouseId = "dc7521a9-c17c-4194-8ba3-eae27f99be34";
    final uri = Uri.parse('http://localhost:8080/v1/control/light');
    await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"id": glasshouseId, "value": mode}),
    );
  }

  static Future<void> waterPlant() async {
    final uri = Uri.parse('http://localhost:8080/v1/control/water-plant');
    await http.post(uri);
  }

  static Future<void> persistLightInterval(bool isStart, DateTime time) async {
    final glasshouseId = "dc7521a9-c17c-4194-8ba3-eae27f99be34";
    final uri = Uri.parse('http://localhost:8080/v1/control/light-interval');
    await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "id": glasshouseId,
        "isStart": isStart,
        "time": {"hours": time.hour, "minutes": time.minute}
      }),
    );
  }
}
