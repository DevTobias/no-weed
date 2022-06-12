import 'package:flutter/material.dart';
import 'package:frontend/features/data/viewmodel/data_viewmodel.dart';
import 'package:frontend/widgets/error_screen.dart';
import 'package:frontend/widgets/loading_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DataView extends ConsumerWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(DataViewmodel.chartDataProvider);

    return _data.when(
      loading: () => LoadingScreen(),
      error: (err, __) => ErrorScreen(errorMessage: err.toString()),
      data: (data) => Center(
        child: SfSparkLineChart(
          data: data!.temperature.map((temp) => temp.value).toList(),
        ),
      ),
    );
  }
}
