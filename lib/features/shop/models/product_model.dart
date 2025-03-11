import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_hptshop/features/shop/models/product_attribute_model.dart';
import 'package:ecommerce_hptshop/features/shop/models/product_variation_model.dart';
import 'brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  /// Create Empty func for clean code
  static ProductModel empty() =>
      ProductModel(id: '',
          title: '',
          stock: 0,
          price: 0,
          thumbnail: '',
          productType: '');

  /// Json Formot
  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'Product Variations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data() ?? {};
    return ProductModel(
      id: document.id,
      sku: data['sku'] ?? '',  // Make sure to use the correct key names from Firestore
      title: data['title'] ?? '',
      stock: data['stock'] ?? 0,
      isFeatured: data['isFeatured'] ?? false,
      price: (data['price'] ?? 0.0) is double ? data['price'] : double.parse(data['price'].toString()),  // Ensuring type safety
      salePrice: (data['salePrice'] ?? 0.0) is double ? data['salePrice'] : double.parse(data['salePrice'].toString()), // Ensuring type safety
      thumbnail: data['thumbnail'] ?? '',
      categoryId: data['categoryId'] ?? '',
      description: data['description'] ?? '',
      productType: data['productType'] ?? '',
      brand: data['brand'] != null ? BrandModel.fromJson(data['brand']) : null,  // Null check for brand
      images: data['images'] != null ? List<String>.from(data['images']) : [],  // Ensure 'Images' is a list or empty
      productAttributes: data['productAttributes'] != null
          ? (data['productAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList()
          : [],  // Handle missing or null attributes
      productVariations: data['productVariations'] != null
          ? (data['productVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList()
          : [],  // Handle missing or null variations
    );
  }

}
