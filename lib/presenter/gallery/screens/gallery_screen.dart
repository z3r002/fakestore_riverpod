import 'package:auto_route/auto_route.dart';
import 'package:fakestore_riverpod/presenter/gallery/widgets/card_grid_gallery.dart';
import 'package:fakestore_riverpod/providers/gallery_provider.dart';
import 'package:fakestore_riverpod/shared/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/shimmer_grid.dart';

@RoutePage()
class GalleryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final galleryState = ref.watch(galleryProvider);

    return Scaffold(
      backgroundColor: UIColors.c101012,
      appBar: AppBar(title: const Text('Продукты')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Категории с горизонтальным скроллом
          Container(
            height: 50, // Фиксированная высота для категорий
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                child: Row(
                  children: galleryState.categories
                      .map(
                        (category) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Consumer(
                            builder: (context, ref, _) {
                              final isSelected = ref.watch(galleryProvider.select(
                                (state) => state.selectedCategory == category,
                              ));
                              return GestureDetector(
                                onTap: () => ref.read(galleryProvider.notifier)
                                    .filterProductsByCategory(category),
                                child: Chip(
                                  label: Text(
                                    category,
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : null,
                                    ),
                                  ),
                                  backgroundColor: isSelected 
                                      ? Colors.blue 
                                      : Colors.grey[300],
                                ),
                              );
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
          
          // Сетка товаров
          Expanded(
            child: Builder(
              builder: (context) {
                if (galleryState.isLoading) {
                  return const UIShimmerGrid();
                }

                // Проверяем, что у нас есть товары для отображения
                final products = galleryState.filteredProducts;
                if (products.isEmpty) {
                  return const Center(
                    child: Text('Нет товаров в выбранной категории'),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // Дополнительная проверка на случай, если список изменился
                    if (index >= 0 && index < products.length) {
                      return UICardGridGallery(product: products[index]);
                    }
                    return const SizedBox.shrink();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
