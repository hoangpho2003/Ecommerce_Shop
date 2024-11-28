import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  static HomeController get instance => get.find();
  
  final carousalCurrentIndex = 0.obs;

  static get get => null;
  
  void updatePAgeIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}