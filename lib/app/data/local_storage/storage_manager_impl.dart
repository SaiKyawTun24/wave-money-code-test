import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wave_money_code_test/app/data/local_storage/storage_constant.dart';
import 'package:wave_money_code_test/app/data/local_storage/storage_manager.dart';

class StorageManagerImpl extends StorageManager {
  static final Map<String, Box<dynamic>> _openedBoxes = {};

  Future<Box<dynamic>> _box(String boxName) async {
    try {
      if (!_openedBoxes.containsKey(boxName)) {
        if (Hive.isBoxOpen(boxName)) {
          _openedBoxes[boxName] = Hive.box<dynamic>(boxName);
        } else {
          _openedBoxes[boxName] = await Hive.openBox<dynamic>(boxName);
        }
      }
      return _openedBoxes[boxName]!;
    } catch (e) {
      debugPrint('Error opening box $boxName: $e');
      throw Exception('Failed to open box $boxName');
    }
  }

  Future<Box<dynamic>> openBox(String boxName) => _box(boxName);

  Future<void> removeByPrefix(String boxName, String prefix) async {
    final box = await _box(boxName);
    final keysToRemove =
        box.keys.where((key) => key.toString().startsWith(prefix)).toList();

    for (final key in keysToRemove) {
      await box.delete(key);
    }

    debugPrint(
        'Removed ${keysToRemove.length} items with prefix "$prefix" from $boxName.');
  }

  @override
  Future<void> setAllObjects<T>(String boxName, Map<String, T> objects) async {
    final box = await _box(boxName);
    await box.putAll(objects);
  }

  @override
  Future<List<T>> getAllHiveObjects<T>(String boxName) async {
    final box = await _box(boxName);
    final allEntries = box.toMap().entries;
    final filteredValues = allEntries
        .where((entry) => entry.key != recipesTimestampKey)
        .map((entry) => entry.value)
        .toList();
    return filteredValues.cast<T>().toList();
  }

  @override
  Future<T?> getHiveObject<T>(String boxName, String key) async {
    final box = await _box(boxName);
    return box.get(key) as T?;
  }

  @override
  Future<void> setHiveObject<T>(String boxName, String key, T object) async {
    final box = await _box(boxName);
    return await box.put(key, object);
  }

  @override
  Future<void> clear(
    String boxName,
  ) async {
    final box = await _box(boxName);
    await box.clear();
  }

  @override
  Future<void> remove(String boxName, String key) async {
    final box = await _box(boxName);
    await box.delete(key);
  }

  static Future<void> closeAllBoxes() async {
    for (var box in _openedBoxes.values) {
      await box.close();
    }
    _openedBoxes.clear();
  }
}
