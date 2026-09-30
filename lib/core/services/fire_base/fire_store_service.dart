abstract class FireStoreService {
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  });

  Future<bool> checkIfData({required String path, required String documentId});
}
