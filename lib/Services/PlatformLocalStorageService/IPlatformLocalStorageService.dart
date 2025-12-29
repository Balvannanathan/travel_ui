abstract class IPlatformLocalStorageService {
  Future<void> addData<T>(String key, T value);

  Future<T?> getData<T>(String key);

  Future<void> deleteData(String key);

  Future<void> deleteAllData();
}
