import 'package:support__81/common/customtext.dart';
import 'package:support__81/features/About%20us/about_us.dart';
import 'package:support__81/features/Address/screens/add_address.dart';
import 'package:support__81/features/Address/screens/added_address.dart';
import 'package:support__81/features/Address/screens/edit_address_screen.dart';
import 'package:support__81/features/Bookmark/screens/bookmark_screen.dart';
import 'package:support__81/features/Contact%20us/screens/contact_us.dart';
import 'package:support__81/features/Home/screens/homescreen.dart';
import 'package:support__81/features/Location/screen/fetch_location.dart';
import 'package:support__81/features/Order/screen/my_order_screen.dart';
import 'package:support__81/features/Payment/screens/add_card_screen.dart';
import 'package:support__81/features/Payment/screens/added_cards.dart';
import 'package:support__81/features/Product%20Details/screens/product_details.dart';
import 'package:support__81/features/Profile/screens/change_password.dart';
import 'package:support__81/features/Profile/screens/edit_profile.dart';
import 'package:support__81/features/Rating%20&%20Review/screens/rate_review_screen.dart';
import 'package:support__81/features/Rating%20&%20Review/screens/write_review.dart';
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
    //Profile
    case EditProfile.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => EditProfile(),
      );
    case ChangePassword.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ChangePassword(),
      );
    case AboutUs.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AboutUs(),
      );
    case ContactUs.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => ContactUs(),
      );
    case AddedCards.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddedCards(),
      );
    case AddCard.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddCard(),
      );
    case AddedAddress.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddedAddress(),
      );
    case AddAddress.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddAddress(),
      );
   
    case MyOrdersScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MyOrdersScreen(),
      );
    case WriteReview.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => WriteReview(),
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
