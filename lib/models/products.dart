
import '../helper/app_assets.dart';

class Products {
  final String id;
  final String title;
  final int price;
  final String imageUrl;
  final int discontValue;
  final String category;
  final double? rating;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.discontValue = 0,
    this.category = 'Other',
    this.rating,
  });
}

List<Products> dumnyProducts = [
  Products(
    id: '1', title: 'hot T-shirts', price: 22, imageUrl: AppAssets.superSummerSaleAsset, discontValue:20,category: 'tshirts',rating: 4.5,
  ),
  Products(
    id: '2', title: 'hot T-shirts2', price: 100, imageUrl: AppAssets.topBannerHomePageAsset, discontValue:10,rating: 4.1,
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


