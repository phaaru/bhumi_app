import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './listing_card.dart';
import '../../providers/products.dart';
import '../details/detail_screen.dart';

class YourListings extends StatelessWidget {
  const YourListings({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final listings = List<Widget>();

    for (var cards in productsData.items) {
      listings.add(
        ListingCard(
          image: cards.image,
          press: () {
            Navigator.of(context).pushNamed(
              DetailsScreen.routeName,
              arguments: cards.id,
            );
          },
          price: cards.price,
          quatity: cards.description,
          title: cards.title,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: listings,
        // children: <Widget>[
        //   ListingCard(
        //     image: 'assets/images/bhindi.jpg',
        //     press: () {
        //       print("triggered");
        //       Navigator.of(context).pushNamed(DetailsScreen.routeName);
        //     },
        //     price: 35,
        //     quatity: '1 KG',
        //     title: 'bhindi',
        //   ),
        //   ListingCard(
        //     image: 'assets/images/cabbage.jpg',
        //     press: () {},
        //     price: 40,
        //     quatity: '1 KG',
        //     title: 'cabbage',
        //   ),
        //   ListingCard(
        //     image: 'assets/images/onion.jpg',
        //     press: () {},
        //     price: 100,
        //     quatity: '1 KG',
        //     title: 'garlic',
        //   ),
        // ],
      ),
    );
  }
}
