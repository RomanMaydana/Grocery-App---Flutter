import 'dart:math';

import 'package:flutter/material.dart';
import 'package:grocery_store/gracery_store_bloc.dart';
import 'package:grocery_store/grocery_store_cart.dart';
import 'package:grocery_store/grocery_store_list.dart';

import 'gracery_provider.dart';

const backgroundColor = Color(0xfff6f5f2);
const cartBarHight = 100.0;

const _panelTransition = Duration(milliseconds: 500);

class GroceryHome extends StatefulWidget {
  @override
  _GroceryHomeState createState() => _GroceryHomeState();
}

class _GroceryHomeState extends State<GroceryHome> {
  final bloc = GroceryStoreBloc();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta < -7) {
      bloc.changeToCart();
    } else if (details.primaryDelta > 12) {
      bloc.changeToNormal();
    }
  }

  double _getTopForWhitePanel(GroceryState state, double height) {
    if (state == GroceryState.normal) {
      return -cartBarHight + kToolbarHeight;
    } else if (state == GroceryState.cart) {
      return -(height - kToolbarHeight - cartBarHight / 2);
    }
    return 0.0;
  }

  double _getTopForBlackPanel(GroceryState state, double maxHeight) {
    if (state == GroceryState.normal) {
      return maxHeight - cartBarHight;
    } else if (state == GroceryState.cart) {
      return cartBarHight / 2;
    }
    return 0.0;
  }

  double _getTopForAppBar(GroceryState state) {
    if (state == GroceryState.normal) {
      return 0.0;
    } else if (state == GroceryState.cart) {
      return -cartBarHight;
    }
    return 0.0;
  }

  @override
  Widget build(BuildContext context) {
    // final heighTop = MediaQuery.of(context).padding.top;
    // print(size.height);
    return GroceryProvider(
      bloc: bloc,
      child: AnimatedBuilder(
          animation: bloc,
          builder: (context, _) {
            return SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final maxHeight = constraints.maxHeight;
                  return Scaffold(
                    backgroundColor: Colors.black,
                    body: Stack(
                      children: [
                        AnimatedPositioned(
                            duration: _panelTransition,
                            curve: Curves.decelerate,
                            left: 0,
                            right: 0,
                            top: _getTopForWhitePanel(
                                bloc.groceryState, maxHeight),
                            height: maxHeight - kToolbarHeight,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: GroceryStoreList(),
                              ),
                            )),
                        AnimatedPositioned(
                            duration: _panelTransition,
                            curve: Curves.decelerate,
                            left: 0,
                            right: 0,
                            top: _getTopForBlackPanel(
                                bloc.groceryState, maxHeight),
                            height: maxHeight - kToolbarHeight,
                            child: GestureDetector(
                              onVerticalDragUpdate: _onVerticalGesture,
                              child: Container(
                                color: Colors.black,
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25.0, vertical: 25),
                                    child: Container(
                                      color: Colors.black,
                                      height: kToolbarHeight,
                                      child: AnimatedSwitcher(
                                        duration: _panelTransition,
                                        child:
                                            bloc.groceryState ==
                                                    GroceryState.normal
                                                ? Row(children: [
                                                    Text('Cart',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20)),
                                                    Expanded(
                                                        child:
                                                            SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Row(
                                                            children:
                                                                List.generate(
                                                                    bloc.cart
                                                                        .length,
                                                                    (index) =>
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(horizontal: 8.0),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Hero(
                                                                                tag: 'list_${bloc.cart[index].product.name}details',
                                                                                child: CircleAvatar(
                                                                                  backgroundColor: Colors.white,
                                                                                  backgroundImage: AssetImage(bloc.cart[index].product.image),
                                                                                ),
                                                                              ),
                                                                              Positioned(
                                                                                right: 0,
                                                                                child: CircleAvatar(
                                                                                  radius: 10,
                                                                                  backgroundColor: Colors.red,
                                                                                  child: Text(
                                                                                    bloc.cart[index].quantity.toString(),
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ))),
                                                      ),
                                                    )),
                                                    CircleAvatar(
                                                      backgroundColor:
                                                          Color(0xfff4c459),
                                                      child: Text(bloc
                                                          .totalElement()
                                                          .toString()),
                                                    )
                                                  ])
                                                : const SizedBox.shrink(),
                                      ),
                                    ),
                                  ),
                                  Expanded(child: GroceryStoreCart())
                                ]),
                              ),
                            )),
                        AnimatedPositioned(
                            duration: _panelTransition,
                            curve: Curves.decelerate,
                            left: 0,
                            right: 0,
                            top: _getTopForAppBar(bloc.groceryState),
                            child: _AppBarGrocery())
                      ],
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}

class _AppBarGrocery extends StatelessWidget {
  const _AppBarGrocery({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: kToolbarHeight,
        color: backgroundColor,
        child: Row(
          children: [
            BackButton(color: Colors.black),
            Expanded(
                child: Text(
              'Fruits and vegetables alt',
              style: TextStyle(color: Colors.black),
            )),
            IconButton(icon: Icon(Icons.settings), onPressed: () {})
          ],
        ));
  }
}
