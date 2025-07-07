import 'package:fakestore_riverpod/main.dart';
import 'package:fakestore_riverpod/model/product_dto.dart';
import 'package:fakestore_riverpod/routing/router.gr.dart';
import 'package:fakestore_riverpod/shared/const/colors.dart';
import 'package:flutter/material.dart';
class UICardGridGallery extends StatelessWidget {
  const UICardGridGallery({super.key, required this.product});
  final ProductResponse product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        appRouter.push(GalleryDetailsCardRoute(product: product));
      },
      child: Container(
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
      ),
    );
  }
}
