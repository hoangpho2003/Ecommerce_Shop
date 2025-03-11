import 'package:ecommerce_hptshop/data/repositories/banners/banner_repository.dart';
import 'package:ecommerce_hptshop/features/shop/models/banner_model.dart';
import 'package:get/get.dart';
import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();

  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;


  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  void updatePAgeIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  Future<void> fetchBanner() async{
    try{
      isLoading.value = true;
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      this.banners.assignAll(banners);
    } catch(e){
      HptLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally{
      isLoading.value = false;
    }
  }
}