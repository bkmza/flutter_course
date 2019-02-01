import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_elements/title_default.dart';
import '../scoped-models/main.dart';
import '../models/product.dart';
import '../widgets/products/product_fab.dart';

class ProductPage extends StatelessWidget {
  final Product product;

  ProductPage(this.product);

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Union Square, San Francisco',
            style: TextStyle(fontFamily: 'Oswald', color: Colors.grey)),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text('|',
                style: TextStyle(
                  color: Colors.grey,
                ))),
        Text('\$' + price.toString(),
            style: TextStyle(fontFamily: 'Oswald', color: Colors.grey))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 256.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(product.title),
                background: Hero(
                  tag: product.id,
                  child: FadeInImage(
                    height: 300.0,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/food.jpg'),
                    image: NetworkImage(product.image),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                    padding: EdgeInsets.all(10.0),
                    child: TitleDefault(product.title)),
                _buildAddressPriceRow(product.price),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                  ),
                )
              ]),
            )
          ],
        ),
        floatingActionButton: ProductFAB(product),
      ),
    );
  }
}
