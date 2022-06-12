import 'package:frontend/features/control/model/control_model.dart';
import 'package:frontend/features/control/service/control_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ControlService {
  static final controlProvider = Provider.autoDispose<ControlService>(
    (ref) => ControlService(),
  );

  Future<ControlModel?> getControlData() async {
    return ControlRepoistory.getControlData();
  }

  Future<void> persistLightMode(bool mode) async {
    return ControlRepoistory.persistLightMode(mode);
  }

  Future<void> waterPlant() async {
    return ControlRepoistory.waterPlant();
  }

  Future<void> persistLightInterval(bool isStart, DateTime time) async {
    return ControlRepoistory.persistLightInterval(isStart, time);
  }
}

class LightsNotifier extends StateNotifier<bool> {
  LightsNotifier(this.ref) : super(false) {
    initState();
  }

  final Ref ref;

  void initState() async {
    state = (await ref.read(ControlService.controlProvider).getControlData())
            ?.lightOn ??
        false;
  }

  void setIsLight(bool value) => state = value;
}
