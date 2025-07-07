import 'package:fakestore_riverpod/api/api_client.dart';
import 'package:fakestore_riverpod/model/product_dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final galleryProvider = StateNotifierProvider<GalleryNotifier, GalleryState>(
  (ref) => GalleryNotifier(),
);
class GalleryState {
  final bool isLoading;
  final List<ProductResponse> products;

  const GalleryState({
    this.isLoading = false,
    this.products = const [],
  });

  GalleryState copyWith({
    bool? isLoading,
    List<ProductResponse>? products,
  }) =>
      GalleryState(
        isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products,
      );
}

class GalleryNotifier extends StateNotifier<GalleryState> {
  GalleryNotifier() : super(const GalleryState()){
    loadProducts();
  }

  Future<void> loadProducts() async {
    state = state.copyWith(isLoading: true);
    try{
      final products = await ApiClient.instance().getProducts();
      state = state.copyWith(products: products, isLoading: false);
    }catch(e){
      state = state.copyWith(isLoading: false);
      print(e);
    }

  }
}
