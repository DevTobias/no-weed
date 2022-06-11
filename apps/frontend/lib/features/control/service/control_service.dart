import 'package:frontend/features/control/model/control_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

class ControlService {
  static final controlProvider = Provider.autoDispose<ControlService>(
    (ref) => ControlService(),
  );

  Future<ControlModel> fetchCurrentData() async {
    final uri = Uri.parse(
        'https://my-json-server.typicode.com/DevTobias/no-weed/center');
    final data = (await http.get(uri)).body;
    return ControlModel(
        temperature: 28.3, moisture: 23, lightLevel: 230, waterLevel: 42);
    //return ControlModel.fromJson(json.decode(data));
  }

  Future<void> setLightMode(bool mode) async {
    return;
  }

  Future<void> waterPlant() async {
    print("manually water plant");
    return;
  }
}
