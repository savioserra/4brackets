import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/id.dart';
import 'package:hive/hive.dart';

class Repository<T extends Id> {
  final String boxName;

  Repository(this.boxName);

  Box<T> get box => Hive.box<T>(boxName);

  Future<void> create(T value) async {
    value.id = Uuid().v4();
    return box.put(value.id, value);
  }

  Future<void> update(T value) async {
    if (value.id == null) {
      throw 'Id field is empty. Did you forget to call .create()?';
    }

    return box.put(value.id, value);
  }

  T find(String key) {
    return box.get(key);
  }

  Future<void> delete(String key) {
    return box.delete(key);
  }

  ValueListenable<Box<T>> watch({List<String> keys}) {
    return box.listenable(keys: keys);
  }
}
