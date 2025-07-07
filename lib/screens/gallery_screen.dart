import 'package:auto_route/auto_route.dart';
import 'package:fakestore_riverpod/providers/gallery_provider.dart';
import 'package:fakestore_riverpod/shared/const/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryState = ref.watch(galleryProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Продуткы')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: galleryState.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 4, crossAxisSpacing: 4),
            itemBuilder: (BuildContext context, int index) {
              final product = galleryState.products[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: UIColors.white,
                ),
                child: Column(
                  children: [
                    Image.network(
                      product.image.toString(),
                      height: 100,
                      width: 100,
                    ),
                    Text(
                      product.title.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
