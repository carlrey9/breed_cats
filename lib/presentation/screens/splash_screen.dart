import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:the_cat_app_test/data/constants/constants.dart';
import 'package:the_cat_app_test/presentation/providers/breeds_data.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          _ImageWidget(),
          _TitleWidget(),
          _LoadingWidget(),
        ],
      ),
    );
  }

  Future<void> _getData() async {
    await ref.read(breedsDataProvider.notifier).getData();
    await CountryCodes.init();
    GoRouter.of(context).goNamed("landing");
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          margin: const EdgeInsets.only(top: 150),
          child: const CircularProgressIndicator()),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Image.network(
        Constants.url_default_cat_image,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Cat Breeds",
        style: TextStyle(
          color: Colors.white,
          fontSize: 60,
        ),
      ),
    );
  }
}
