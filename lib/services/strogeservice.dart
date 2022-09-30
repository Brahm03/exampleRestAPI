import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService.init();
  static StorageService get instance => _instance;
  StorageService.init();

  final storage = GetStorage();

}
