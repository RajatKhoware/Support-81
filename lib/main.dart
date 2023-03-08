import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:support__81/constant/app_theme.dart';
import 'package:support__81/features/Auth/screens/sign-in.dart';
import 'package:support__81/features/Auth/screens/sign-up.dart';
import 'package:support__81/features/Cart/screen/my_cart.dart';
import 'package:support__81/features/Events/screens/upcoming_event.dart';
import 'package:support__81/features/Home/screens/homescreen.dart';
import 'package:support__81/features/Location/screen/fetch_location.dart';
import 'package:support__81/features/Notificaion/screens/notification_screen.dart';
import 'package:support__81/features/Offers%20&%20Deals/screens/offer_screen.dart';
import 'package:support__81/features/Order/screen/check_out_screen.dart';
import 'package:support__81/features/Order/screen/order_placed.dart';
import 'package:support__81/features/Profile/screens/profile_screen.dart';
import 'package:support__81/features/Splash/screen/splashscreen.dart';
import 'package:support__81/provider/bookmark_provider.dart';
import 'package:support__81/provider/cart_provider.dart';
import 'package:support__81/provider/user_provider.dart';
import 'package:support__81/router.dart';

import 'features/Bookmark/services/bookmark_services.dart';
import 'features/Cart/services/cart_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BookmarkedProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MyApp(),
      // DevicePreview(enabled: true, builder: (context) => MyApp()),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CartServices _cartServices = CartServices();
  BookmarkServices _bookmarkServices = BookmarkServices();

  @override
  void initState() {
    super.initState();
    getCart();
    fetchBookmarkProducts();
  }

  void getCart() {
    _cartServices.getCart(context);
    setState(() {});
  }

  void fetchBookmarkProducts() {
    _bookmarkServices.getBookmarkedProducts(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 781),
      builder: (context, child) => MaterialApp(
        //  builder: DevicePreview.appBuilder,
        title: 'Support 81',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        onGenerateRoute: (settings) => generateRoute(settings),
        // Routes
        routes: {
          "/home": (context) => const HomeScreen(),
          "/splash": (context) => const SplashScreen(),
          "/sign-in": (context) => const SignInScreen(),
          "/sign-up": (context) => const SignUpScreen(),
          "/fetch-location": (context) => const FetchLocationScreen(),
          "/my-cart": (context) => const MyCart(),
          "/profile": (context) => const ProfileScreen(),
          "/check-out": (context) => const CheckOutScreen(),
          // "/rate-review": (context) => const RateAndReviewScreen(),
          "/order-placed": (context) => const OrderPlacedScreen(),
          "/offer-page": (context) => const OfferAndDealsScreen(),
          "/upcoming-event": (context) => const UpcomingEventScreen(),
          "/notification": (context) => const NotificationScreen(),
        },
      ),
    );
  }
}
