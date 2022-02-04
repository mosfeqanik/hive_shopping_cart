
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  
  late TabController tabController;
  var scrollController=ScrollController();
  var homePageName='Home'.obs;
  
  @override
  void onInit() {
    tabController=TabController(length: 4, vsync: this);
    super.onInit();
  }
  
  
  
  
  

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



}