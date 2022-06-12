import 'dart:convert';
import 'package:frontend/features/data/model/data_model.dart';
import 'package:http/http.dart' as http;

class DataRepository {
  static Future<DataModel?> getData() async {
    final glasshouseId = "dc7521a9-c17c-4194-8ba3-eae27f99be34";
    final uri = Uri.parse(
        'http://194.94.204.88:8080/v1/control/all-data/$glasshouseId');
    final req = await http.get(uri);

    if (req.statusCode != 200) return null;

    return DataModel.fromJson(json.decode(req.body));
  }
}
