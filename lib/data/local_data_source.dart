

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource{
  Future<bool> store(StorageTodoKey key,String data);
  String? read(StorageTodoKey key);
  Future<bool>remove(StorageTodoKey key);
}

class LocalDataSourceImpl implements LocalDataSource{
  final SharedPreferences db;
  const LocalDataSourceImpl({required this.db});

  static Future<SharedPreferences> get init async{
    return SharedPreferences.getInstance();
  }

  @override
  String? read(StorageTodoKey key) {
    return db.getString(key.name);
  }

  @override
  Future<bool> remove(StorageTodoKey key) {
    return db.remove(key.name);
  }

  @override
  Future<bool> store(StorageTodoKey key, String data) async{
    return await db.setString(key.name, data);
  }
}

enum StorageTodoKey{
  todo
}