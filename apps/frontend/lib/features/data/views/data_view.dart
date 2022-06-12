import 'package:flutter/material.dart';
import 'package:frontend/features/data/model/data_model.dart';
import 'package:frontend/features/data/viewmodel/data_viewmodel.dart';
import 'package:frontend/widgets/error_screen.dart';
import 'package:frontend/widgets/loading_screen.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DataView extends ConsumerWidget {
  const DataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(DataViewmodel.chartDataProvider);
    final dropdownValue = ref.watch(DataViewmodel.dataProvider);

    return _data.when(
      loading: () => LoadingScreen(),
      error: (err, __) => ErrorScreen(errorMessage: err.toString()),
      data: (data) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 180, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfSparkLineChart(
                color: Colors.lightGreen,
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                trackball: SparkChartTrackball(
                    activationMode: SparkChartActivationMode.tap),
                marker: SparkChartMarker(
                    displayMode: SparkChartMarkerDisplayMode.all),
                data: getData(dropdownValue, data),
              ),
              Gap(40),
              DropdownButton<String>(
                value: dropdownValue,
                elevation: 16,
                onChanged: (String? newValue) {
                  ref
                      .read(DataViewmodel.dataProvider.notifier)
                      .setDataMode(newValue ?? dropdownValue);
                },
                items: <String>['Temperature', 'Light Level', 'Humidity']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<double> getData(String mode, DataModel? data) {
    if (mode == 'Temperature')
      return data!.temperature.map((temp) => temp.value).toList();
    if (mode == 'Light Level')
      return data!.lightLevel.map((temp) => temp.value + 0.0).toList();
    return data!.humidity.map((temp) => temp.value + 0.0).toList();
  }
}
