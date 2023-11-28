import '../repositories/storage_repository/storage_repository.dart';

class MetaInfoService {
  static final StorageRepository _storageRep = StorageRepositoryImpl();
  static const String _keyFirstOpen = "is_first_open";
  static const String _showTutorial = "show_tutorial";

  static bool isFirstOpen() => _storageRep.getInfo(_keyFirstOpen) ?? true;

  static void registerAppOpening() async {
    await _storageRep.setInfo(_keyFirstOpen,
        _storageRep.getInfo(_keyFirstOpen) == null ? true : false);
  }

  static Future<bool> showTutorial() async {
    bool show = _storageRep.getInfo(_showTutorial) ?? true;
    await _storageRep.setInfo(_showTutorial, false);
    return show;
  }
}
