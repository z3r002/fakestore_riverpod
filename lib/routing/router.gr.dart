// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:fakestore_riverpod/model/product_dto.dart' as _i6;
import 'package:fakestore_riverpod/presenter/gallery/screens/gallery_details_card.dart'
    as _i3;
import 'package:fakestore_riverpod/presenter/gallery/screens/gallery_screen.dart'
    as _i2;
import 'package:fakestore_riverpod/presenter/splash_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i5;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    UISplashScreenRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.UISplashScreen(),
      );
    },
    GalleryScreenRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.GalleryScreen(),
      );
    },
    GalleryDetailsCardRoute.name: (routeData) {
      final args = routeData.argsAs<GalleryDetailsCardRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.GalleryDetailsCard(
          key: args.key,
          product: args.product,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.UISplashScreen]
class UISplashScreenRoute extends _i4.PageRouteInfo<void> {
  const UISplashScreenRoute({List<_i4.PageRouteInfo>? children})
      : super(
          UISplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'UISplashScreenRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.GalleryScreen]
class GalleryScreenRoute extends _i4.PageRouteInfo<void> {
  const GalleryScreenRoute({List<_i4.PageRouteInfo>? children})
      : super(
          GalleryScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'GalleryScreenRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.GalleryDetailsCard]
class GalleryDetailsCardRoute
    extends _i4.PageRouteInfo<GalleryDetailsCardRouteArgs> {
  GalleryDetailsCardRoute({
    _i5.Key? key,
    required _i6.ProductResponse product,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          GalleryDetailsCardRoute.name,
          args: GalleryDetailsCardRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'GalleryDetailsCardRoute';

  static const _i4.PageInfo<GalleryDetailsCardRouteArgs> page =
      _i4.PageInfo<GalleryDetailsCardRouteArgs>(name);
}

class GalleryDetailsCardRouteArgs {
  const GalleryDetailsCardRouteArgs({
    this.key,
    required this.product,
  });

  final _i5.Key? key;

  final _i6.ProductResponse product;

  @override
  String toString() {
    return 'GalleryDetailsCardRouteArgs{key: $key, product: $product}';
  }
}
