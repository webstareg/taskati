import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/routing.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home/presentation/view/home_view.dart';
import 'package:taskati/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    bool isUpload = AppLocalStorage.getCachedData('isUpload') ?? false;
    Future.delayed(const Duration(seconds: 3), () {
      navigateWithReplacment(
          context, (isUpload) ? const HomeView() : const UploadView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AssetImages.appIcon,
            ),
            const Gap(20),
            Text(
              'Taskati',
              style: getTitleStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
            const Gap(10),
            Text('It\'s Time To Get Organized', style: getSmallStyle()),
          ],
        ),
      ),
    );
  }
}
