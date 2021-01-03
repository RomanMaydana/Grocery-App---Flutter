import 'package:flutter/material.dart';
import 'package:grocery_store/grocery_home.dart';
import 'package:grocery_store/grocery_store_details.dart';
import 'package:grocery_store/staggered_dual_view.dart';

import 'gracery_provider.dart';

class GroceryStoreList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: cartBarHight, bottom: 5),
      child: StaggeredDualView(
        aspctRatio: 0.7,
        offsetPercent: 0.3,
        itemBuilder: (context, index) {
          final product = bloc.catalog[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(PageRouteBuilder(pageBuilder: (page, animation, __) {
                return FadeTransition(
                    opacity: animation,
                    child: GroceryStoreDetails(
                        product: product,
                        onProductAdded: () {
                          bloc.addProduct(product);
                        }));
              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: 'list_${product.name}',
                        child: Image.asset(
                          product.image,
                          fit: BoxFit.contain,
                          height: 100,
                        ),
                      ),
                    ),
                    Text(
                      product.price.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      product.name,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 14),
                    ),
                    Text(
                      product.weight,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: 14),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: bloc.catalog.length,
      ),
    );
    // return ListView.builder(
    //   padding: const EdgeInsets.only(top: cartBarHight),
    //   itemCount: bloc.catalog.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //         height: 100,
    //         color: Colors.primaries[index % Colors.primaries.length]);
    //   },
    // );
  }
}
