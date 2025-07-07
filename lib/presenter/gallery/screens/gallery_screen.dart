import 'package:auto_route/auto_route.dart';
import 'package:fakestore_riverpod/presenter/gallery/widgets/card_grid_gallery.dart';
import 'package:fakestore_riverpod/providers/gallery_provider.dart';
import 'package:fakestore_riverpod/shared/const/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../widgets/shimmer_grid.dart';

@RoutePage()
class GalleryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryState = ref.watch(galleryProvider);

    return Scaffold(
      backgroundColor: UIColors.c101012,
      appBar: AppBar(title: const Text('Продукты')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: galleryState.isLoading
            ? UIShimmerGrid()
            : GridView.builder(
                itemCount: galleryState.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio:
                      0.75, // Adjusted for better card proportions
                ),
                itemBuilder: (BuildContext context, int index) {
                  final product = galleryState.products[index];
                  return UICardGridGallery(product: product);
                },
              ),
      ),
    );
  }
}
