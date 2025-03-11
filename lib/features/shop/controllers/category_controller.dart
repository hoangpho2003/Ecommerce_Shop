import 'package:ecommerce_hptshop/data/repositories/categories/category_repository.dart';
import 'package:ecommerce_hptshop/features/shop/models/category_model.dart';
import 'package:ecommerce_hptshop/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async{
    try{
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      allCategories.assignAll(categories);
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());
    } catch(e){
      HptLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }
}