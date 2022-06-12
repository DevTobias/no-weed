import 'package:frontend/features/data/model/data_model.dart';
import 'package:frontend/features/data/service/data_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataViewmodel {
  static final chartDataProvider = FutureProvider.autoDispose<DataModel?>(
    (ref) async => ref.read(DataService.dataProvider).getAllData(),
  );
}
