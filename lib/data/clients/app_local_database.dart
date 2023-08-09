import 'dart:async';
import 'dart:io';

import 'package:ideploy_package/ideploy_package.dart';

class AppLocalDatabase {
  static final AppLocalDatabase _instance = AppLocalDatabase._();
  static AppLocalDatabase get instance => _instance;

  Completer<Database>? _dbOpenCompleter;

  AppLocalDatabase._();

  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer<Database>();
      await _openDatabase();
    }

    return _dbOpenCompleter!.future;
  }

  Future<void> _openDatabase() async {
    final Directory _appDocumentDir = await getApplicationDocumentsDirectory();
    final String _dbPath = '${_appDocumentDir.path}/honest_pdv.db';
    final Database _database = await databaseFactoryIo.openDatabase(_dbPath);
    _dbOpenCompleter!.complete(_database);
  }
}
