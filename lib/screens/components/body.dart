import 'package:bhumi_app/constants.dart';
import 'package:flutter/material.dart';

import './header_with_search_box.dart';
import './title_with_add_button.dart';
import './your_listings.dart';
import './from_other_sellers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Total height and width of screen
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithAddButton(
            title: 'Your Listings',
            press: () {},
          ),
          YourListings(),
          TitleWithAddButton(
            title: "From other Sellers",
            press: () {},
          ),
          FromOtherSellers(),
          SizedBox(
            height: kDefaultPadding,
          ),
        ],
      ),
    );
  }
}
