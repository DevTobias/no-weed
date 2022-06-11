import 'package:frontend/features/control/model/control_model.dart';
import 'package:frontend/features/control/service/control_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

// move is light to other real service, try to initialize state notifier
// with this value
class LightNotifier extends StateNotifier<bool> {
  bool _isLight = false;

  bool get isLight => _isLight;

  LightNotifier() : super(false) {
    _load();
  }

  void setIsLight(bool value) {
    state = value;
  }

  _load() async {
    final uri = Uri.parse(
      'https://my-json-server.typicode.com/DevTobias/no-weed/lightOn',
    );
    final data = (await http.get(uri)).body;
    //state = data == "true";
  }
}

class AllCollectionsViewmodel {
  static final controlDataProvider = FutureProvider.autoDispose<ControlModel>(
    (ref) async => ref.read(ControlService.controlProvider).fetchCurrentData(),
  );

  static final lightDataProvider =
      StateNotifierProvider.autoDispose<LightNotifier, bool>(
    (ref) => LightNotifier(),
  );
}
