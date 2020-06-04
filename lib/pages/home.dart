import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_task/pages/cart.dart';

import '../providers/product.dart';

class HomePage extends StatelessWidget {
  static final routeName = '/home';
  @override
  Widget build(BuildContext context) {
    
    final mediaQuery = MediaQuery.of(context);
    final products = Provider.of<Product>(context).products;
    final productData = Provider.of<Product>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: mediaQuery.size.height * 0.03),
                child: Text(
                  "Products",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: mediaQuery.size.width * 0.7,
                    height: mediaQuery.size.height * 0.3,
                    child: Card(
                      elevation: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(products[index].image),
                              fit: BoxFit.fill),
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: mediaQuery.size.height * 0.2,
                            ),
                            Container(
                              width: mediaQuery.size.width,
                              height: mediaQuery.size.height * 0.09,
                              color: Colors.grey[300],
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    products[index].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    products[index].quantity.toString(),
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () => productData
                                        .selectProduct(products[index]),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: mediaQuery.size.height * 0.02,
              ),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(CartPage.routeName),
                child: Text('Go To Cart'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
