import 'package:frontend/features/data/model/data_model.dart';
import 'package:frontend/features/data/service/data_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DataService {
  static final dataProvider = Provider.autoDispose<DataService>(
    (ref) => DataService(),
  );

  Future<DataModel?> getAllData() async {
    return DataRepository.getData();
  }
}
