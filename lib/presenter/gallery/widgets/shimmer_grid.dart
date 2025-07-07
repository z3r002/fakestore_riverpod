import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../shared/const/colors.dart';

class UIShimmerGrid extends StatelessWidget {
  const UIShimmerGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
    );
  }
}
