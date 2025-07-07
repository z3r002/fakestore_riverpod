import 'package:auto_route/auto_route.dart';
import 'package:fakestore_riverpod/model/product_dto.dart';
import 'package:fakestore_riverpod/shared/const/colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GalleryDetailsCard extends StatelessWidget {
  const GalleryDetailsCard({Key? key, required this.product}) : super(key: key);
  final ProductResponse product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UIColors.c101012,
      appBar: AppBar(title: Text(product.title.toString())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            product.image.toString(),
            alignment: Alignment.topCenter,
            // Выравнивание по верхнему краю
            fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 100,
              color: Colors.grey[700],
              child: const Icon(Icons.error, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    product.title.toString(),
                    style: TextStyle(
                      fontSize: product.title.toString().length > 30 ? 16 : 20, // Уменьшаем шрифт для длинных названий
                      color: UIColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '€ ${product.price.toString()}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.lightGreenAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.description.toString(),
                style: const TextStyle(fontSize: 16, color: UIColors.white)),
          ),
        ],
      ),
    );
  }
}
