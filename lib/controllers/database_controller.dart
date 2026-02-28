import 'package:ecommerce_app_with_firebase/helper/api_path.dart';
import 'package:ecommerce_app_with_firebase/models/products.dart';

import '../services/firestore.dart';

abstract class Database {
  Stream<List<Products>> getNewProductsStream();
  Stream<List<Products>> getSaleProductsStream();
}

class FireStoreDatabase implements Database {
  final String uid;
  final FirestoreServices _service = FirestoreServices.instance;

  FireStoreDatabase(this.uid);

  @override
  Stream<List<Products>> getNewProductsStream() =>
      _service.collectionStreamToReadData(
        path: ApiPath.products(),
        builder: (data, documentId) => Products.fromMap(data, documentId),
      );

  @override
  Stream<List<Products>> getSaleProductsStream() =>
      _service.collectionStreamToReadData(
        path: ApiPath.products(),
        builder: (data, documentId) => Products.fromMap(data, documentId),
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
      );

  Future<void> setProduct(Products product) async =>
      _service.setData(
          path: 'products/${product.id}',
          data: product.toMap(),
      );
}
