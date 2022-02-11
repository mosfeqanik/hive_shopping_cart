
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/Utils/api.dart';
import 'package:e_commerce_app/screens/model/products/products_data.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{


  var selectedItemIndex=0.obs;


  RxObjectMixin<ProductsData> productData=ProductsData().obs;




  @override
  void onInit() {
    _getHomeProductData();
    super.onInit();
  }


  void _getHomeProductData() async{

    var connectivityResult = await (Connectivity().checkConnectivity());

    Dio _dio=Dio();
    var myUrl=API.getProductDataEndPoint;
    try{

      if(connectivityResult ==ConnectivityResult.none){
        print('No Internet Connection');
        Get.snackbar('Ops!', 'No Internet Connection');

      }else{

        EasyLoading.show();
        var response1= await _dio.get(myUrl);
        print('HTTP Request: URL $myUrl');
        print('HTTP Request: Status Code ${response1.statusCode}');
        if(response1.statusCode==200){
          EasyLoading.dismiss();

          var myData=response1.data;
          productData.value=ProductsData.fromJson(myData);
          print(myData);
        }else{
          print('Data not found ');
        }

      }


    }catch(e, l){
      print(runtimeType);
      print(e);
      print(l);
    }
  }


}