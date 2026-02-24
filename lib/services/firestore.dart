import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreServices {
  FirestoreServices._();
  static final instance = FirestoreServices._();
  final _firestore = FirebaseFirestore.instance;

  ///Add data to a document
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    debugPrint('Request Data: $data');
    await _firestore.doc(path).set(data);
  }

  ///Delete data from a document
  Future<void> deleteData({required String path}) async {
    await _firestore.doc(path).delete();
  }

  ///data from a document
  Stream<T> documentStreamToReadData<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
  }) {
    final reference = _firestore.doc(path);

    return reference.snapshots().map((
      DocumentSnapshot<Map<String, dynamic>> docSnap,
    ) {
      final data = docSnap.data();
      if (data == null) {
        throw Exception('Document at $path does not exist');
      }
      return builder(data, docSnap.id);
    });
  }

  ///List of data from a collection
  Stream<List<T>> collectionStreamToReadData<T>({
    required String path,
    required T Function(Map<String, dynamic> data, String documentId) builder,
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _firestore.collection(path);

    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapshots = query.snapshots();
    return snapshots.map((snapshot) {
       final result = snapshot.docs
          .map((doc) => builder(doc.data() as Map<String, dynamic>, doc.id))
          .where((value) => value != null)
          .toList();
       if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }
}
