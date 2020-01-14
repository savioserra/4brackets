import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/id.dart';
import 'package:hive/hive.dart';

class Repository<T extends Id> {
  final String boxName;

  Repository(this.boxName);

  Box<T> get box => Hive.box<T>(boxName);

  Future<bool> _commit(AsyncCallback callback) {
    return callback().then((r) => true).catchError(() => false);
  }

  Future<bool> create(T value) async {
    return _commit(() async {
      value.id = Uuid().v4();
      await box.put(value.id, value);
    });
  }

  Future<bool> update(T value) async {
    return _commit(() async {
      if (value.id == null) {
        throw 'Id field is empty. Did you forget to call .create()?';
      }

      await box.put(value.id, value);
    });
  }

  T find(String key) {
    return box.get(key);
  }

  Future<bool> delete(String key) {
    return _commit(() => box.delete(key));
  }

  ValueListenable<Box<T>> watch({List<String> keys}) {
    return box.listenable(keys: keys);
  }
}
