import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spark_task/providers/product.dart';

class CartPage extends StatelessWidget {
  static final routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final selectedProducts = Provider.of<Product>(context).selectedProducts;
    return Scaffold(
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: selectedProducts.length,
        itemBuilder: (context, index) {
          return Container(
            width: mediaQuery.size.width * 0.7,
            height: mediaQuery.size.height * 0.3,
            child: Card(
              elevation: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(selectedProducts[index].image),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            selectedProducts[index].name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
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
    );
  }
}
