import '../../features/shop/models/banner_model.dart';
import '../../routes/routes.dart';
import '../../utils/constants/image_strings.dart';

class UploadData{
  static final List<BannerModel> banners = [
  BannerModel(imageUrl: HptImages.banner1, targetScreen: HptRoutes.order, active: false),
  BannerModel(imageUrl: HptImages.banner2, targetScreen: HptRoutes.cart, active: true),
  BannerModel(imageUrl: HptImages.banner3, targetScreen: HptRoutes.favourites, active: true),
  BannerModel(imageUrl: HptImages.banner4, targetScreen: HptRoutes.search, active: true),
  BannerModel(imageUrl: HptImages.banner5, targetScreen: HptRoutes.settings, active: true),
  BannerModel(imageUrl: HptImages.banner6, targetScreen: HptRoutes.userAddress, active: true),
  BannerModel(imageUrl: HptImages.banner8, targetScreen: HptRoutes.checkout, active: false),
  ];
}