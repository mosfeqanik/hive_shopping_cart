

import 'package:badges/badges.dart';
import 'package:e_commerce_app/Utils/api.dart';
import 'package:e_commerce_app/Utils/hive_data/hive_entity.dart';
import 'package:e_commerce_app/screens/home/product_details_controller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import 'home_controller.dart';


class ProductDetails extends StatelessWidget {
  static const String routeName='/product_details';

  final ProductDetailsController _controller=Get.put(ProductDetailsController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: Obx(()=>Text(_controller.productData.value.products![_controller.selectedItemIndex.value].name??'')),

        actions: [
          Padding(

            padding: const EdgeInsets.only(right: 20, top: 5),

            child: Badge(
              badgeColor: Colors.yellow,
              badgeContent: Obx(()=>Center(child: Text(Get.put(HomeController()).localDataList.length.toString()))),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),


        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // child: Image.network("${API.productImageUrl}$url"),
            // _con.productData.value.products![index].image![0].toString()

            Container(
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              height: 200,
              width: double.infinity,
              child: Obx(()=>Image.network("${API.productImageUrl}${_controller.productData.value.products![_controller.selectedItemIndex.value].image![0].toString()}")),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              color: Colors.white,
              height: 40,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [

                  const Padding(padding: EdgeInsets.only(left: 10),
                  child: Text('Price: 110')),

                  Padding(padding: const EdgeInsets.only(right: 10),
                      child: IconButton(onPressed: (){

                        Get.put(HomeController()).insertShoppingCartData(HiveEntity(
                            title: '${_controller.productData.value.products![_controller.selectedItemIndex.value].name}',
                            price: '${_controller.productData.value.products![_controller.selectedItemIndex.value].price}',
                            id: '${_controller.productData.value.products![_controller.selectedItemIndex.value].id}',
                            image: "${API.productImageUrl}${ _controller.productData.value.products![_controller.selectedItemIndex.value].image![0].toString()}")
                        );





                      }, icon: const Icon(Icons.shopping_cart_outlined))),

                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              color: Colors.white,
              height: 200,
              width: double.infinity,
              // child: Html(
              //
              //     data: "<h1>The ol and ul elements</h1> <p>The ol element defines an ordered list:</p> <ol> <li>Coffee</li> <li>Tea</li> <li>Milk</li> </ol> <p>The ul element defines an unordered list:</p> <ul> <li>Coffee</li> <li>Tea</li> <li>Milk</li> </ul>"),
            ),



          ],
        ),
      ),
    );
  }
}
