
import '../helper/app_assets.dart';

class Products {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final int discountValue;
  final String category;
  final double? rating;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.discountValue = 0,
    this.category = 'Other',
    this.rating,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imageUrl': imageUrl,
      'discountValue': discountValue,
      'category': category,
      'rating': rating,
    };
  }
  factory Products.fromMap(Map<String, dynamic> map, String documentId) {
    return Products(
      id: documentId,
      title: map['title'] as String,
      price: map['price'] as int,
      imageUrl: map['imageUrl'] as String,
      discountValue: map['discountValue'] as int,
      category: map['category'] as String,
      rating: map['rating'] as double,
    );
  }
}

List<Products> dumnyProducts = [
  Products(
    id: '1', title: 'hot T-shirts', price: 22, imageUrl: AppAssets.superSummerSaleAsset, discountValue:20,category: 'tshirts',rating: 4.5,
  ),
  Products(
    id: '2', title: 'hot T-shirts2', price: 100, imageUrl: AppAssets.topBannerHomePageAsset, discountValue:10,rating: 4.1,
  ),
  Products(
    id: '3', title: 'hot T-shirts3', price: 50, imageUrl: AppAssets.superSummerSaleAsset,category: 'tshirts',rating: 4.9,
  ),
  Products(
    id: '3', title: 'hot T-shirts3', price: 50, imageUrl: AppAssets.topBannerHomePageAsset,category: 'tshirts',rating: 4.9,
  ),
  Products(
    id: '3', title: 'hot T-shirts3', price: 50, imageUrl: AppAssets.superSummerSaleAsset,category: 'tshirts',rating: 4.9,
  ),
  Products(
    id: '3', title: 'hot T-shirts3', price: 50, imageUrl: AppAssets.topBannerHomePageAsset,category: 'tshirts',rating: 4.9,
  ),
];


