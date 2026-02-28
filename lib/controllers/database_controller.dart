import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_with_firebase/models/products.dart';

import '../services/firestore.dart';

abstract class Database {
  Stream<List<Products>> getProductsStream();
}

class FireStoreDatabase implements Database {
  final FirestoreServices _service = FirestoreServices.instance;

  @override
  Stream<List<Products>> getProductsStream() => _service.collectionStreamToReadData(
    path: 'products/',
    builder: (data, documentId) => Products.fromMap(data, documentId),
  );
}
