import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/Categories/screens/category_tab.dart';
import '../features/Home/widgets/tabs/newest_tab.dart';
import '../features/Home/widgets/tabs/offer_tab.dart';
import '../features/Home/widgets/tabs/popular_tab.dart';
import '../features/Home/widgets/tabs/top_rated_tab.dart';

class AppLists {
  //? HOME

  //Tab Lables
  static List<String> tabLables = [
    "Top Rated",
    "Popular",
    "Newest",
    "Category",
    // "Offers"
  ];

  //Tab Icons
  static List tabIcons = [
    Icons.star,
    Icons.trending_up,
    CupertinoIcons.news,
    CupertinoIcons.square_grid_2x2,
    // CupertinoIcons.ticket,
  ];

  //TabBar view screens
  static List tabScreens = const [
    TopRatedTab(),
    PopularTab(),
    NewestTab(),
    CategoryTab(),
    // OfferTab()
  ];

  static List<List<String>> productList = [
    [
      "assets/products/tshirt_pack.png",
      "Hells Angeles 2 T-Shirts Support81...",
      "\$ 20.00",
      
    ],
    [
      "assets/products/jacket.png",
      "Hells Angeles 2 Anniversary Black..",
      "\$ 25.00",
    ],
    [
      "assets/products/cap.png",
      "Hells Angeles Cap Support81 Cpssta..",
      "\$ 20.00",
    ],
    [
      "assets/products/vest.png",
      "Hells Angeles Garage81 Support81...",
      "\$ 20.00",
    ]
  ];

  static List<List<dynamic>> productListd = [
    [
      "assets/products/tshirt_pack.png",
      "Hells Angeles 2 T-Shirts Support81...",
      "\$ 20.00",
      "20",
    ],
    [
      "assets/products/jacket.png",
      "Hells Angeles 2 Anniversary Black..",
      "\$ 25.00",
      "25",
    ],
    [
      "assets/products/cap.png",
      "Hells Angeles Cap Support81 Cpssta..",
      "\$ 20.00",
      "20",
    ],
    [
      "assets/products/vest.png",
      "Hells Angeles Garage81 Support81...",
      "\$ 20.00",
      "20",
    ]
  ];
}
