import 'package:bhumi_app/screens/details/components/details_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/products.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      body: DetailsBody(loadedProduct),
    );
  }
}
