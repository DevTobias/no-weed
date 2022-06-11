import 'package:flutter/material.dart';
import 'package:frontend/features/control/viewmodel/control_viewmodel.dart';
import 'package:frontend/features/control/views/control_view_content.dart';
import 'package:frontend/features/control/widgets/control-header.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ControlView extends ConsumerWidget {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(AllCollectionsViewmodel.controlDataProvider);
    return _data.when(
      loading: () => Scaffold(
        appBar: ControlHeader(),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (err, __) => SafeArea(child: Text(err.toString())),
      data: (data) => Scaffold(
        appBar: ControlHeader(),
        body: ControlViewContent(
          data: data,
        ),
      ),
    );
  }
}
