import 'package:auto_route/auto_route.dart';
import 'package:fakestore_riverpod/routing/router.gr.dart';
@AutoRouterConfig(
  replaceInRouteName: "",
)
class AppRouter extends $AppRouter {


  @override
  List<AutoRoute> get routes => [
    CustomRoute(
        transitionsBuilder: TransitionsBuilders.noTransition,
        page: UISplashScreenRoute.page,
        initial: true),
    AutoRoute(page: GalleryScreenRoute.page),
    AutoRoute(page: GalleryDetailsCardRoute.page),
  ];
}