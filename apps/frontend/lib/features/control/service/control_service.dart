import 'package:frontend/features/control/model/control_model.dart';
import 'package:frontend/features/control/model/light_phase_model.dart';
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

class LightPhaseNotifier extends StateNotifier<LightPhaseModel> {
  static final defaultValue =
      LightPhaseModel(startHour: 8, endHour: 19, startMinute: 0, endMinute: 0);

  LightPhaseNotifier(this.ref) : super(defaultValue) {
    initState();
  }

  final Ref ref;

  void initState() async {
    final data =
        await ref.read(ControlService.controlProvider).getControlData();

    if (data == null) state = defaultValue;

    state = LightPhaseModel(
      startHour: data!.startHour,
      endHour: data.endHour,
      startMinute: data.startMinute,
      endMinute: data.endMinute,
    );
  }

  void setLightPhase(bool isStart, DateTime time) {
    if (isStart)
      state = state.copyWith(startHour: time.hour, startMinute: time.minute);
    else
      state = state.copyWith(endHour: time.hour, endMinute: time.minute);
  }
}
