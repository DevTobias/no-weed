import 'package:flutter/material.dart';
import 'package:frontend/features/control/viewmodel/control_viewmodel.dart';
import 'package:frontend/features/control/views/control_view_content.dart';
import 'package:frontend/widgets/error_screen.dart';
import 'package:frontend/widgets/loading_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ControlView extends ConsumerWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(AllCollectionsViewmodel.controlDataProvider);
    return _data.when(
      loading: () => LoadingScreen(),
      error: (err, __) => ErrorScreen(errorMessage: err.toString()),
      data: (data) => ControlViewContent(data: data),
    );
  }
}
