import 'dart:io';

import 'package:e_commerce_app/screens/home/home_screen.dart';
import 'package:e_commerce_app/screens/home/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'Utils/hive_data/hive_entity.dart';



void main() async{
  HttpOverrides.global = MyHttpOverrides();

  ///Hive Setup
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HiveEntityAdapter());
  await Hive.openBox<HiveEntity>('samir_app_database');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),


      builder: EasyLoading.init(),
      getPages: [



        GetPage(name: '/', page: () => HomeScreen(),transition: Transition.fadeIn ),
        GetPage(name: ProductDetails.routeName, page: () => ProductDetails(),transition: Transition.fadeIn),
        // GetPage(name: HomeScreen.routeName, page: () => HomeScreen(),transition: Transition.fadeIn),
        // GetPage(name: LoginScreen.routeName, page: () => LoginScreen(),transition: Transition.fadeIn),
        // GetPage(name: DetailsScreen.routeName, page: () => DetailsScreen(),transition: Transition.fadeIn, ),
      ],

      // class HomeScreen extends StatelessWidget {
      // static const String routeName='/home_screen';




    );
  }
}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}


