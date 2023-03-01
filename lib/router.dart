import 'package:support__81/common/customtext.dart';
import 'package:support__81/features/Bookmark/screens/bookmark_screen.dart';
import 'package:support__81/features/Home/screens/homescreen.dart';
import 'package:support__81/features/Location/screen/fetch_location.dart';
import 'package:support__81/features/Product%20Details/screens/product_details.dart';
import 'package:support__81/features/Rating%20&%20Review/screens/rate_review_screen.dart';
import 'package:support__81/features/Splash/screen/splashscreen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case ProductDetailsPage.routeName:
      var product = routeSettings.arguments as double;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ProductDetailsPage(
          productId: product,
        ),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => HomeScreen(),
      );
    case BookMarkScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BookMarkScreen(),
      );
    case SplashScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => SplashScreen(),
      );
    case RateAndReviewScreen.routeName:
      var productId = routeSettings.arguments as double;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => RateAndReviewScreen(
          productId: productId,
        ),
      );
    case FetchLocationScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => FetchLocationScreen(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => Scaffold(
          body: Center(child: CustomText(text: "Error 404 !")),
        ),
      );
  }
}
