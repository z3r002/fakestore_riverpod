import 'package:auto_route/auto_route.dart';
import 'package:fakestore_riverpod/routing/router.gr.dart';
import 'package:fakestore_riverpod/shared/const/colors.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';

@RoutePage()
class UISplashScreen extends StatefulWidget {
  const UISplashScreen({Key? key}) : super(key: key);

  @override
  State<UISplashScreen> createState() => _UISplashScreenState();
}

class _UISplashScreenState extends State<UISplashScreen> {

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
     appRouter.replace(GalleryScreenRoute());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.c101012,
    );
  }
}
