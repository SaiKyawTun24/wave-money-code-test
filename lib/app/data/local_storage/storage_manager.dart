abstract class StorageManager {
  Future<void> setAllObjects<T>(String boxName, Map<String, T> objects);

  Future<List<T>> getAllHiveObjects<T>(String boxName);

  Future<T?> getHiveObject<T>(String boxName, String key);

  Future<void> setHiveObject<T>(String boxName, String key, T object);

  Future<void> remove(String boxName,String key);

  Future<void> clear(String boxName);
}
