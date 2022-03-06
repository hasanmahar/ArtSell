import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:artsell/blocs/cart/cart_bloc.dart';
import 'package:artsell/blocs/category/category_bloc.dart';
import 'package:artsell/blocs/checkout/checkout_bloc.dart';
import 'package:artsell/blocs/product/product_bloc.dart';
import 'package:artsell/blocs/wishlist/wishlist_bloc.dart';
import 'package:artsell/config/theme.dart';
import 'package:artsell/config/app_router.dart';
import 'package:artsell/repositories/category/category_repository.dart';
import 'package:artsell/repositories/checkout/checkout_repository.dart';
import 'package:artsell/screens/order_confirmation/order_confirmation_screen.dart';
import 'package:artsell/screens/screens.dart';
import 'package:artsell/simple_bloc_observer.dart';

import 'repositories/product/product_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(WishlistStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        )
      ],
      child: MaterialApp(
        title: 'ARTSELL',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}
