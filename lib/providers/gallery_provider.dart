import 'package:fakestore_riverpod/api/api_client.dart';
import 'package:fakestore_riverpod/model/product_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final galleryProvider = StateNotifierProvider<GalleryNotifier, GalleryState>(
  (ref) => GalleryNotifier(),
);
class GalleryState {
  final bool isLoading;
  final List<ProductResponse> products;
  final List<ProductResponse> filteredProducts;
  final List<String> categories;
  final String? selectedCategory;

  const GalleryState({
    this.isLoading = false,
    this.products = const [],
    this.filteredProducts = const [],
    this.categories = const [],
    this.selectedCategory,
  });

  GalleryState copyWith({
    bool? isLoading,
    List<ProductResponse>? products,
    List<ProductResponse>? filteredProducts,
    List<String>? categories,
    String? selectedCategory,
  }) {
    return GalleryState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

class GalleryNotifier extends StateNotifier<GalleryState> {
  GalleryNotifier() : super(const GalleryState()){
    loadProducts();
  }

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true);
    try {
      final List<ProductResponse> products = await ApiClient.instance().getProducts();
      final List<String> categories = ['Все', ...products
          .map<String>((ProductResponse product) => product.category ?? 'Без категории')
          .where((String category) => category.isNotEmpty)
          .toSet()
          .toList()];
      
      state = state.copyWith(
        products: products,
        filteredProducts: products,
        isLoading: false,
        categories: categories,
        selectedCategory: 'Все',
      );
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print(e);
    }
  }
  
  void filterProductsByCategory(String category) {
    try {
      final newState = state.copyWith(
        selectedCategory: category,
        filteredProducts: category == 'Все' 
            ? List.from(state.products) // Создаем новый список, а не ссылку
            : state.products
                .where((product) => product.category == category)
                .toList(),
      );
      
      if (mounted) {
        state = newState;
      }
    } catch (e) {
      print('Error filtering products: $e');
      // В случае ошибки возвращаемся к отображению всех товаров
      if (mounted) {
        state = state.copyWith(
          selectedCategory: 'Все',
          filteredProducts: List.from(state.products),
        );
      }
    }
  }

}
