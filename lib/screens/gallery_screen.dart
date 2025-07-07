import 'package:auto_route/auto_route.dart';
import 'package:fakestore_riverpod/providers/gallery_provider.dart';
import 'package:fakestore_riverpod/shared/const/colors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.75,
                ),
                itemCount: 6, // Placeholder count for shimmer
                itemBuilder: (BuildContext context, int index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey[800]!,
                    highlightColor: Colors.grey[600]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            UIColors.c1C2526, // Slightly lighter than scaffold
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            color: Colors.grey[700],
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 20,
                            width: 100,
                            color: Colors.grey[700],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
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
                  return Container(
                    decoration: BoxDecoration(
                      color: UIColors.c1C2526, // Contrasting card background
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
                          child: Image.network(
                            product.image.toString(),
                            height: 180,
                            alignment: Alignment.topCenter,
                            // Выравнивание по верхнему краю
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 100,
                              color: Colors.grey[700],
                              child:
                                  const Icon(Icons.error, color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 8, left: 8),
                          child: Text(product.price.toString() + ' €',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  color: Colors.lightGreenAccent)),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 2),
                            child: Text(
                              product.title.toString(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                color: Colors.white, // White text as requested
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only( left: 12, ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 15),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(product.rating!.rate.toString(),
                                    style: TextStyle(color: Colors.amber))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8,)
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
