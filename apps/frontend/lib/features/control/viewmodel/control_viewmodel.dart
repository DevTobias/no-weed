import 'package:frontend/features/control/model/control_model.dart';
import 'package:frontend/features/control/service/control_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AllCollectionsViewmodel {
  static final controlDataProvider = FutureProvider.autoDispose<ControlModel>(
    (ref) async => ref.read(ControlService.controlProvider).getControlData(),
  );

  static final lightsProvider =
      StateNotifierProvider.autoDispose<LightsNotifier, bool>(
    (ref) => LightsNotifier(ref),
  );
}
