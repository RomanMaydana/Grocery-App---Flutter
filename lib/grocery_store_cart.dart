import 'package:flutter/material.dart';
import 'package:grocery_store/gracery_provider.dart';

class GroceryStoreCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = GroceryProvider.of(context).bloc;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Cart',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Expanded(
                  child: ListView.builder(
                    itemCount: bloc.cart.length,
                    itemBuilder: (context, index) {
                      final item = bloc.cart[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(item.product.image),
                            ),
                            const SizedBox(width: 15),
                            Text(item.quantity.toString()),
                            const SizedBox(width: 10),
                            Text('x'),
                            const SizedBox(width: 10),
                            Text(item.product.name),
                            Spacer(),
                            Text(
                                '\$${(item.product.price * item.quantity).toStringAsFixed(2)}'),
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  bloc.deleteProduct(item);
                                })
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text('Total',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
              Spacer(),
              Text('\$${bloc.totalPriceElement().toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Color(0xfff4c459),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              onPressed: () {}),
        ),
      ],
    );
  }
}
