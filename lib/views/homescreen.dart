import 'package:demo1/controller/product_controller.dart';
import 'package:demo1/widget/item_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        centerTitle: true,
      ),
      body: Obx(
        () => Visibility(
          visible: productController.loading.value,
          replacement: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.6,
              children: List.generate(
                productController.listProduct.length,
                (index) => itemContainer(
                  productController.listProduct[index],
                ),
              ),
            ),
          ),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
