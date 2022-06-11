import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:frontend/features/control/model/control_model.dart';

class ControlRepoistory {
  static Future<ControlModel> getControlData() async {
    final uri = Uri.parse(
      'https://my-json-server.typicode.com/DevTobias/no-weed/center',
    );
    final data = (await http.get(uri)).body;
    return ControlModel.fromJson(json.decode(data));
  }
}
