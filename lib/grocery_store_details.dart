import 'package:flutter/material.dart';
import 'package:grocery_store/grocery_product.dart';

class GroceryStoreDetails extends StatefulWidget {
  const GroceryStoreDetails(
      {Key key, @required this.product, this.onProductAdded})
      : super(key: key);

  final GroceryProduct product;
  final VoidCallback onProductAdded;

  @override
  _GroceryStoreDetailsState createState() => _GroceryStoreDetailsState();
}

class _GroceryStoreDetailsState extends State<GroceryStoreDetails> {
  String _heroTag = '';
  void _addToCart(BuildContext context) {
    setState(() {
      _heroTag = 'details';
    });
    widget.onProductAdded();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  Expanded(
                    child: Hero(
                      tag: 'list_${widget.product.name}$_heroTag',
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.cover,
                        // height: MediaQuery.of(context).size.height * 0.36,
                      ),
                    ),
                  ),
                  Text(widget.product.name,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(widget.product.weight,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.grey,
                          )),
                  Row(children: [
                    Spacer(),
                    Text('\$${widget.product.price}',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ]),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('About the product',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.black,
                          )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.product.description,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                          )),
                ])),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                      flex: 4,
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
                          onPressed: () => _addToCart(context)))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
