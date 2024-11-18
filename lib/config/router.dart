import 'package:go_router/go_router.dart';
import 'package:the_cat_app_test/domain/models/breed_model.dart';
import 'package:the_cat_app_test/presentation/screens/detail_screen.dart';
import 'package:the_cat_app_test/presentation/screens/landing_screen.dart';
import 'package:the_cat_app_test/presentation/screens/splash_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      name: 'landing',
      builder: (context, state) => const LandingScreen(),
      routes: [
        GoRoute(
          path: 'detail',
          name: 'detail',
          builder: (context, state) => DetailScreen(
            breedModel: state.extra as BreedModel,
          ),
        ),
      ],
    ),
  ],
  initialLocation: '/splash',
);
