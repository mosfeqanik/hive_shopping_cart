
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/Utils/api.dart';
import 'package:e_commerce_app/screens/model/category.dart';
import 'package:e_commerce_app/screens/model/products/products_data.dart';


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';


class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  
  late TabController tabController;
  var scrollController=ScrollController();
  var homePageName='Home'.obs;
  var categoryData=<Category>[].obs;

  RxObjectMixin<ProductsData> productData=ProductsData().obs;

  
  @override
  void onInit() {
    tabController=TabController(length: 4, vsync: this);
    _getHomeProductData();
    super.onInit();
  }

  // void _getCategoryData() async{
  //   Dio _dio=Dio();
  //   try{
  //
  //     var response= await _dio.get(API.getCategoryDataEndPoint);
  //     print('My HTTP REQUEST: Class name $runtimeType : statusCode: ${response.statusCode}');
  //     if(response.statusCode==200){
  //
  //
  //               // var myData=response1.data['data'] as List;
  //
  //
  //               var myData=response.data as List;
  //
  //               print(myData);
  //
  //               var postList=myData.map((e) => Category.fromJson(e)).toList();
  //               print('postList $postList');
  //
  //               // var myReceivedList=myData.map((e) => PostModel.fromJson(e)).toList();
  //               //
  //               // print('HTTP Request: Before Insert Data ${myPostList.length} ');
  //               categoryData.addAll(postList);
  //               print(categoryData.length);
  //
  //
  //       //
  //       // var myResponse=response.data as List;
  //       //
  //       // // print(myResponse);
  //       //
  //       // List<CategoryModel> list=myResponse.map((e){
  //       //   print(e);
  //       //   return CategoryModel.fromJson(e);
  //       // }).toList();
  //       //
  //       // print(list);
  //       // // categoryData.value=list;
  //       // // print('caterfksdf ${categoryData.length}');
  //       //
  //       //
  //       //
  //       //
  //       // // categoryData.value=CategoryModel.fromJson(myResponse);
  //       // // print(categoryData.value.name);
  //
  //     }else{
  //     }
  //   }catch(e){
  //     print(e);
  //   }
  //
  //
  //
  //
  //
  // }
  //
  
  
  
  

  // var sharedUsername=''.obs;
  // var sharedEmail=''.obs;
  // var sharedPhone=''.obs;
  // var sharedImage=''.obs;
  // late TabController tabBarController;
  // int bottomCurrentIndex=0;
  // var homePageName='Home Page'.obs;
  // var categoryPageName='Category Page'.obs;
  // var personPageName='Person Page'.obs;
  //
  // var scrollController=ScrollController();
  //
  // @override
  // void onInit() {
  //
  //   tabBarController=TabController(length: 3, vsync: this);
  //   getSharedPrefData();
  //   super.onInit();
  // }
  //
  // void getSharedPrefData() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try{
  //
  //     sharedUsername.value=prefs.getString('CSI-APP-USERNAME')!;
  //     sharedEmail.value=prefs.getString('CSI-APP-EMAIL')!;
  //     sharedPhone.value=prefs.getString('CSI-APP-MOBILE')!;
  //     sharedImage.value=prefs.getString('CSI-APP-IMAGEURL')!;
  //
  //   }catch(e){
  //     print(e);
  //   }
  // }
  //
  // void logout() async{
  //   ///Method -1
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.clear();
  //   Get.offAll(LoginScreen());
  //
  //
  //   ///Method -2
  //   ///Logout by server
  //
  //
  //
  //
  //
  //
  // }
  //
  //
  // void logoutMethod() async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //
  //   var loginUrl='https://vendor.eshopweb.store/app/v1/api/logout';
  //   var body={
  //     'mobile':'01811913041',
  //   };
  //   var header={
  //     'Authorization':'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjIwMDE3OTAyMDUsImlhdCI6MTY0MTc5MDIwNSwiaXNzIjoiZXNob3AifQ.pMhVWFe_ql39Pdt4jh0D3v-_cQsO0XgqDUVlUSwEb6E',
  //   };
  //   Dio _dio=Dio();
  //
  //   try{
  //
  //     print('My HTTP REQUEST: Class name $runtimeType : Url: $loginUrl');
  //     print('My HTTP REQUEST: Class name $runtimeType : Body: $body');
  //     print('My HTTP REQUEST: Class name $runtimeType : Header $header');
  //
  //
  //     var response= await _dio.post(loginUrl, data: body,  options: Options(headers: header));
  //
  //     print('My HTTP REQUEST: Class name $runtimeType : statusCode: ${response.statusCode}');
  //
  //
  //     if(response.statusCode==200){
  //       var myResponse=response.data;
  //       var msg=myResponse['message'];
  //
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.clear();
  //       Get.offAll(LoginScreen());
  //
  //
  //
  //     }else{
  //
  //     }
  //
  //
  //
  //
  //
  //   }catch(e){
  //     print(e);
  //   }
  //
  //
  //
  //
  //
  // }
  //



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