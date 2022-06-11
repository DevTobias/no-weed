import 'package:frontend/features/control/model/control_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ControlService {
  static final controlProvider = Provider.autoDispose<ControlService>(
    (ref) => ControlService(),
  );

  Future<ControlModel> getControlData() async {
    //return ControlRepoistory.getControlData();

    return ControlModel(
      temperature: 28.3,
      moisture: 23,
      lightLevel: 230,
      waterLevel: 42,
      startHour: 7,
      startMinute: 0,
      endHour: 18,
      endMinute: 0,
      lightOn: true,
    );
  }

  Future<void> persistLightMode(bool mode) async {
    return;
  }

  Future<void> persistLightInterval(bool isStart, DateTime time) async {
    return;
  }

  Future<void> waterPlant() async {
    return;
  }
}

class LightsNotifier extends StateNotifier<bool> {
  LightsNotifier(this.ref) : super(false) {
    initState();
  }

  final Ref ref;

  void initState() async {
    state = (await ref.read(ControlService.controlProvider).getControlData())
        .lightOn;
  }

  void setIsLight(bool value) => state = value;
}
