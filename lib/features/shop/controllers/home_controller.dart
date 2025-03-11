import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_hptshop/features/shop/models/product_variation_model.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/loaders.dart';
import '../models/banner_model.dart';
import '../models/brand_model.dart';
import '../models/category_model.dart';
import '../models/product_attribute_model.dart';
import '../models/product_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // Firestore reference
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload categories from UploadData to Firestore
  Future<void> uploadCategories() async {
    try {
      final categoriesRef = _firestore.collection('Categories');

      for (var category in UploadData.categories) {
        await categoriesRef.add({
          'id': category.id,
          'image': category.image,
          'name': category.name,
          'isFeatured': category.isFeatured,
          'parentId': category.parentId ?? '', // Gán chuỗi rỗng nếu parentId null
        });
      }

      print("Categories uploaded successfully!");
    } catch (e) {
      print("Error uploading categories: $e");
    }
  }

  Future<void> uploadBrands() async {
    try {
      final brandsRef = FirebaseFirestore.instance.collection('Brands');
      for (var brand in UploadData.brands) {
        await brandsRef.add({
          'id': brand.id,
          'image': brand.image,
          'name': brand.name,
          'productsCount': brand.productsCount,
          'isFeatured': brand.isFeatured,
        });
      }
      HptLoaders.successSnackBar(title: 'Success!', message: 'Brands uploaded successfully');
    } catch (e) {
      HptLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    }
  }

  Future<void> uploadProducts() async {
    try {
      final productsRef = FirebaseFirestore.instance.collection('Products');
      for (var product in UploadData.products) {
        final productDoc = await productsRef.add({
          'id': product.id,
          'title': product.title,
          'stock': product.stock,
          'price': product.price,
          'isFeatured': product.isFeatured,
          'thumbnail': product.thumbnail,
          'description': product.description,
          'brand': {
            'id': product.brand?.id,
            'name': product.brand?.name,
            'image': product.brand?.image,
          },
          'images': product.images,
          'salePrice': product.salePrice,
          'sku': product.sku,
          'categoryId': product.categoryId,
          'productType': product.productType,
        });

        // Upload product attributes
        for (var attribute in product.productAttributes ?? []) {
          await productDoc.collection('attributes').add({
            'name': attribute.name,
            'values': attribute.values,
          });
        }

        // Upload product variations
        for (var variation in product.productVariations ?? []) {
          await productDoc.collection('variations').add({
            'id': variation.id,
            'stock': variation.stock,
            'price': variation.price,
            'salePrice': variation.salePrice,
            'image': variation.image,
            'description': variation.description,
            'attributeValues': variation.attributeValues,
          });
        }
      }
      HptLoaders.successSnackBar(title: 'Success!', message: 'Products uploaded successfully');
    } catch (e) {
      HptLoaders.errorSnackBar(title: 'Upload Failed', message: e.toString());
    }
  }
}

class UploadData {
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: HptImages.banner1, targetScreen: HptRoutes.order, active: false),
    BannerModel(imageUrl: HptImages.banner2, targetScreen: HptRoutes.cart, active: true),
    BannerModel(imageUrl: HptImages.banner3, targetScreen: HptRoutes.favourites, active: true),
    BannerModel(imageUrl: HptImages.banner4, targetScreen: HptRoutes.search, active: true),
    BannerModel(imageUrl: HptImages.banner5, targetScreen: HptRoutes.settings, active: true),
    BannerModel(imageUrl: HptImages.banner6, targetScreen: HptRoutes.userAddress, active: true),
    BannerModel(imageUrl: HptImages.banner8, targetScreen: HptRoutes.checkout, active: false),
  ];

  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: HptImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: HptImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: HptImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: HptImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: HptImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: HptImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: HptImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: HptImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),

    ///subcategories
    CategoryModel(id: '8', image: HptImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: HptImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: HptImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),
//furniture
    CategoryModel(id: '11', image: HptImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: HptImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: HptImages.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),
//electronics
    CategoryModel(id: '14', image: HptImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
    CategoryModel(id: '15', image: HptImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),
    CategoryModel(id: '16', image: HptImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),
  ];

  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: HptImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    BrandModel(id: '2', image: HptImages.adidasLogo, name: 'Adidas', productsCount: 95, isFeatured: true),
    BrandModel(id: '8', image: HptImages.kenwoodLogo, name: 'Kenwood', productsCount: 36, isFeatured: false),
    BrandModel(id: '9', image: HptImages.ikeaLogo, name: 'IKEA', productsCount: 36, isFeatured: false),
    BrandModel(id: '5', image: HptImages.appleLogo, name: 'Apple', productsCount: 16, isFeatured: true),
    BrandModel(id: '10', image: HptImages.acerlogo, name: 'Acer', productsCount: 36, isFeatured: false),
    BrandModel(id: '3', image: HptImages.jordanLogo, name: 'Jordan', productsCount: 36, isFeatured: true),
    BrandModel(id: '4', image: HptImages.pumaLogo, name: 'Puma', productsCount: 65, isFeatured: true),
    BrandModel(id: '6', image: HptImages.zaraLogo, name: 'ZARA', productsCount: 36, isFeatured: true),
    BrandModel(id: '7', image: HptImages.electronicsIcon, name: 'Samsung', productsCount: 36, isFeatured: false),
  ];

  /// List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: HptImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(id: '1', image: HptImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [HptImages.productImage1, HptImages.productImage23, HptImages.productImage21, HptImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: HptImages.productImage1,
            description: 'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ProductVariationModel(id: '2', stock: 15, price: 132, image: HptImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(id: '3', stock: 0, price: 234, image: HptImages.productImage23, attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
        ProductVariationModel(id: '4', stock: 222, price: 232, image: HptImages.productImage1, attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
        ProductVariationModel(id: '5', stock: 8, price: 354, image: HptImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        ProductVariationModel(id: '6', stock: 11, price: 332, image: HptImages.productImage21, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: HptImages.productImage69,
      description: 'This is a Product description for Blue Nike Sleeve Less vest. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: HptImages.zaraLogo, name: 'Zara'),
      images: [HptImages.productImage68, HptImages.productImage69, HptImages.productImage5],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: HptImages.productImage64,
      description: 'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: HptImages.zaraLogo, name: 'Zara'),
      images: [HptImages.productImage64, HptImages.productImage65, HptImages.productImage66, HptImages.productImage67],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: '4 color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: HptImages.productImage64,
      description: 'This is a Product description for 4 color collar t-shirt dry fit. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: HptImages.zaraLogo, name: 'Zara'),
      images: [HptImages.productImage60, HptImages.productImage61, HptImages.productImage62, HptImages.productImage63],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: HptImages.productImage1,
            description: 'This is a Product description for 4 color collar t-shirt dry fit.',
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        ProductVariationModel(id: '2', stock: 15, price: 132, image: HptImages.productImage60, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ProductVariationModel(id: '3', stock: 0, price: 234, image: HptImages.productImage61, attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
        ProductVariationModel(id: '4', stock: 222, price: 232, image: HptImages.productImage61, attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
        ProductVariationModel(id: '5', stock: 0, price: 334, image: HptImages.productImage62, attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        ProductVariationModel(id: '6', stock: 11, price: 332, image: HptImages.productImage62, attributeValues: {'Color': 'Green', 'Size': 'EU 32'}),
        ProductVariationModel(id: '7', stock: 0, price: 334, image: HptImages.productImage63, attributeValues: {'Color': 'Blue', 'Size': 'EU 32'}),
        ProductVariationModel(id: '8', stock: 11, price: 332, image: HptImages.productImage63, attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordon Shoes',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: HptImages.productImage64,
      description: 'This is a Product description for Nike Air Jordon Shoes. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: HptImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
      images: [HptImages.productImage7, HptImages.productImage8, HptImages.productImage9, HptImages.productImage10],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Orange', 'Black', 'Brown']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 36,
            salePrice: 12.6,
            image: HptImages.productImage8,
            description: 'This is a Product description for Nike Air Jordon Shoes.',
            attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
        ProductVariationModel(id: '2', stock: 15, price: 35, image: HptImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(id: '3', stock: 14, price: 34, image: HptImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
        ProductVariationModel(id: '4', stock: 13, price: 33, image: HptImages.productImage7, attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(id: '5', stock: 12, price: 32, image: HptImages.productImage9, attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
        ProductVariationModel(id: '6', stock: 11, price: 31, image: HptImages.productImage8, attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '006',
      title: 'Samsung galaxy a51',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: HptImages.productImage11,
      description: 'This is a Product description for Samsung galaxy a51. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: HptImages.appleLogo, name: 'Zara'),
      images: [HptImages.productImage11, HptImages.productImage12, HptImages.productImage13, HptImages.productImage12],
      salePrice: 650,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'Tomi dog food',
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: HptImages.productImage18,
      description: 'This is a Product description for Tomi dog food. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: HptImages.appleLogo, name: 'Zara'),
      images: [HptImages.productImage11, HptImages.productImage12, HptImages.productImage13, HptImages.productImage12],
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Blue', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 32', 'EU 34']),
      ],
      productType: 'ProductType.single',
    ),
  ];
}
