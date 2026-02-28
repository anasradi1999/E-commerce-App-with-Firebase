import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/database_controller.dart';
import '../../../../helper/app_assets.dart';
import '../../../../models/products.dart';
import '../widget/build_header_of_list.dart';
import '../widget/list_item_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(AppAssets.topBannerHomePageAsset,
                width: double.infinity,
                height: size.height * 0.3,
                fit: BoxFit.cover,
              ),
              Opacity(
                opacity: 0.3,
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  color: Colors.black
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 16.0),
                child: Text('Street Clothes',style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,fontSize: 36,color: Colors.white),
              ),
              ),
            ],
          ),
          SizedBox(height: 22,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                BuildHeaderOfList(text: 'Sale', description: 'Super Summer Sale'),
                SizedBox(height: 8,),
                SizedBox(
                  height: 310,
                  child: StreamBuilder<List<Products>>(
                    stream: database.getSaleProductsStream(),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.active) {
                        final products = asyncSnapshot.data;
                        if(products == null || products.isEmpty){
                          return Center(child:Text('No Data Aavilable!'),);
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (_,index) =>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListItemHome(
                                  product: products[index],
                                  nameList: 'Sale',
                                ),
                              ),
                        );
                    }
                      return Center(
                        child: CircularProgressIndicator(color: Colors.red,),
                      );
                    }
                  ),
                ),
                SizedBox(height: 8,),
                BuildHeaderOfList(text: 'New', description: 'Super Summer New'),
                SizedBox(height: 8,),
                SizedBox(
                  height: 310,
                child: StreamBuilder<List<Products>>(
                    stream: database.getNewProductsStream(),
                    builder: (context, asyncSnapshot) {
                      if (asyncSnapshot.connectionState ==
                          ConnectionState.active) {
                        final products = asyncSnapshot.data;
                        if (products == null || products.isEmpty) {
                          return Center(child: Text('No Data Aavilable!'),);
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          itemBuilder: (_,index)=>
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListItemHome(
                                  product: products[index], nameList: 'New',),
                              ),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(color: Colors.red,),
                      );
                    }
                    ),
                ),
            
              ],
            ),
          ),
      
      
        ],
      ),
    );
  }
}
