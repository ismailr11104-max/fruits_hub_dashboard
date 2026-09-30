import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/errors/exceptions.dart';

import 'fire_store_service.dart';

class FireStoreServiceImpl implements FireStoreService {
  final FirebaseFirestore _fireStore;

  FireStoreServiceImpl(this._fireStore);

  @override
  Future<void> setData({
    required String path,
    String? documentId,
    required Map<String, dynamic> data,
  }) async {
    if (documentId != null) {
      await _fireStore.collection(path).doc(documentId).set(data);
    } else {
      await _fireStore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    final snapshot = await _fireStore.collection(path).doc(documentId).get();
    if (!snapshot.exists || snapshot.data() == null) {
      throw ServerException('بيانات المستخدم غير موجودة.');
    }
    return snapshot.data()!;
  }

  @override
  Future<bool> checkIfData({
    required String path,
    required String documentId,
  }) async {
    final data = await _fireStore.collection(path).doc(documentId).get();
    return data.exists;
  }
}
