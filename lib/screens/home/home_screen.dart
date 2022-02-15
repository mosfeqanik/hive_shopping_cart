
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/Utils/api.dart';
import 'package:e_commerce_app/Utils/hive_data/hive_entity.dart';
import 'package:e_commerce_app/Utils/responsive_helper.dart';
import 'package:e_commerce_app/common_wigdet/gridview_item.dart';
import 'package:e_commerce_app/screens/home/product_details.dart';
import 'package:e_commerce_app/screens/home/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'package:badges/badges.dart';

class HomeScreen extends StatelessWidget {

  final HomeController _con=Get.put(HomeController());
  var screenHeight=0.0;
  var screenWidth=0.0;


  @override
  Widget build(BuildContext context) {

    var mediaQueryHeight=MediaQuery.of(context).size.height;
    screenHeight=mediaQueryHeight;
    var mediaQueryHeightByGetX=Get.size.height;


    var mediaQueryWidth=MediaQuery.of(context).size.width;
    screenWidth=mediaQueryWidth;
    var mediaQueryWidthByGetX=Get.size.width;

    print('MediaQuery: H $mediaQueryHeight');
    print('MediaQuery: H $mediaQueryHeightByGetX');

    print('MediaQuery: W $mediaQueryWidth');
    print('MediaQuery: W $mediaQueryWidthByGetX');




    return Scaffold(

      backgroundColor: const Color(0xFFF0F2F5),

      appBar: AppBar(
        title: Center(child: Text('E-commerce App')),
        actions: [
          // IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          // IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined)),
          Padding(
            
            padding: const EdgeInsets.only(right: 20, top: 5),

            child: Badge(
              badgeContent: Obx(()=>Text(_con.localDataList.length.toString())),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),


        ],

        // bottom: TabBar(
        //   controller: _con.tabController,
        //   tabs: [
        //     Text('Home'),
        //     Text('Category'),
        //     Text('Favorite'),
        //     Text('Profile'),
        //   ],
        // ),

      ),
      drawer: Drawer(),


      body: Container(
        child: TabBarView(
            controller: _con.tabController,
            children: [
              Container(
               child: _homeTab(context),

              ),
              Container(
                color: Colors.blueGrey,
                child: Center(child: Text('Category Page')),
              ),
              Container(

                child: _cartTab(),
              ),
              Container(
                color: Colors.yellowAccent,
                child: Center(child: Text('Profile Page')),
              ),
            ]

        ),
      ),

      bottomNavigationBar: GetBuilder<HomeController>(
        builder: (_controller) => BottomNavigationBar(

            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black,
            currentIndex:_controller.tabController.index,

            onTap: (index){

              _controller.tabController.index=index;
              _controller.update();


            },

            items:  [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: _controller.homePageName.value.toString(),
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon:           Badge(
                  badgeContent: Obx(()=>Text(_con.localDataList.length.toString())),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]


        ),

      ),

    );
  }

  Widget _homeTab(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        controller: _con.scrollController,
        child: Column(
          children: [
            _sliderWidget(),
            _myLatestProduct(context)



            // _myGridView(),
             // Expanded(child: GridView.builder(
             //   itemCount: 10,
             //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             //     crossAxisCount: 2,
             //   ),
             //   itemBuilder: (context, index) => Container( height: 200, width: double.infinity,),
             //
             // ))
          ],
        ),
      ),
    );
  }



  _sliderWidget() {

    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.grey,
      //     borderRadius: BorderRadius.all(Radius.circular(10))
      // ),
      margin: EdgeInsets.all(10),
      child: CarouselSlider.builder(

          itemCount: 5,
          itemBuilder: (context, index, realIndex) => Container(
            width: screenWidth,
            height: screenWidth/3,
            child: Image.network('https://www.pngitem.com/pimgs/m/310-3105318_transparent-special-offer-banner-png-png-download.png',fit: BoxFit.cover, ),
          ),

        options: CarouselOptions(
            enlargeCenterPage: true,
            height: screenWidth/3,
            viewportFraction: 1,
            disableCenter: true,
            autoPlay: true,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, reason) {
              // setState(() {
              //   sliderCurrentIndex = index;
              // });

              // print(index);
              // print(reason);
            }
        ),

      ),
    );
  }

  Widget _myLatestProduct(BuildContext context) {




    return Container(
      height: screenHeight*3,
      // color: Colors.black,
      child: Obx(()=>GridView.builder(
        itemCount: _con.productData.value.products?.length??0,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ResponsiveHelper.isMobile(context)? 3:ResponsiveHelper.isTab(context)?4:ResponsiveHelper.isDesktop(context)?5:6,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            print("Item Clicked");
            print("Item Index $index");

          ///  Get.find<ProductDetailsController>().selectedItemIndex.value=index; ///Data stored in another class by dependency  injection
            Get.put(ProductDetailsController()).selectedItemIndex.value=index;

            ///Data stored in another class by dependency  injection
            // print('fsdfds ${Get.put(ProductDetailsController()).selectedItemIndex.value}');

            Get.toNamed(ProductDetails.routeName);
          },
          child: GridViewItem(
              name: '${_con.productData.value.products![index].name}',
              price: '${_con.productData.value.products![index].price}',
              url: _con.productData.value.products![index].image![0].toString(),
              id: _con.productData.value.products![index].id.toString(),
              isFavorite: _con.productData.value.products![index].isFavorite??false,
              favoriteCallBack: (){

                print("Favorite Status: ${_con.productData.value.products![index].isFavorite}");
                print("Favorite Button clicked");

              },
              cartCallBack: (){

                if(_con.checkMyCartItem('${_con.productData.value.products![index].id}')==true){
                  print('Product already exsit');
                }else{
                  _con.insertShoppingCartData(HiveEntity(
                    title: '${_con.productData.value.products![index].name}',
                    price: '${_con.productData.value.products![index].price}',
                    id: '${_con.productData.value.products![index].id}',
                    image: "${API.productImageUrl}${ _con.productData.value.products![index].image![0].toString()}",
                    quantity: 1,
                  ));
                }




              },

          ),
        ),

      )),
    );
  }

  _cartTab() {
    _con.getLocalData();
    return Obx(()=>Column(
      children: [

        Expanded(child: ListView.builder(
          itemCount: _con.localDataList.length,
          itemBuilder: (context, index) => Container(

            margin:  EdgeInsets.only(left: screenWidth*0.01, right:screenWidth*0.01, top: 5), //0.1=10, 0.01=1
            height: 120,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            ///100*0.3=30 100*0.7=70
            child: Row(
              children: [
                Container(
                  width: screenWidth*0.3,///30%  30+68=98
                  // color: Colors.green,
                  height: 120,
                  child: Stack(
                    children: [
                      // ClipRRect(
                      //   child: Image.network(_con.localDataList[index].image),
                      // ),
                      Container(
                        height: 115,
                        width: screenWidth*0.30,
                        child: Image.network(_con.localDataList[index].image),
                      ),

                      Positioned(
                        left: 5,
                        top: 5,
                        child: IconButton(onPressed: (){

                          _con.deleteShoppingCartData(index);

                        }, icon: const Center(child: Icon(Icons.delete))),),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth*0.63, ///68%
                  // color: Colors.amber,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ///10*1=10
                      ///10*2=20
                      ///10*3=30
                      Text(_con.localDataList[index].title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      Text(_con.calculateItemTotalPrice(_con.localDataList[index].price, _con.localDataList[index].quantity),style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 10),
                  width: screenWidth*0.05, ///68%
                  // color: Colors.red,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){

                        _con.updateShoppingCartData(index,HiveEntity(
                          title: '${_con.productData.value.products![index].name}',
                          price: '${_con.productData.value.products![index].price}',
                          id: '${_con.productData.value.products![index].id}',
                          image: _con.localDataList[index].image,
                          quantity: _con.localDataList[index].quantity+1,
                        ));


                      }, icon: const Center(child: Icon(Icons.add))),
                      Center(child: Text(_con.localDataList[index].quantity.toString())),
                      IconButton(onPressed: (){

                        if(_con.localDataList[index].quantity>1){
                          _con.updateShoppingCartData(index,HiveEntity(
                            title: '${_con.productData.value.products![index].name}',
                            price: '${_con.productData.value.products![index].price}',
                            id: '${_con.productData.value.products![index].id}',
                            image: _con.localDataList[index].image,
                            quantity: _con.localDataList[index].quantity-1,
                          ));
                        }else{
                          print("Can't remove");
                        }





                      }, icon: const Center(child: Icon(Icons.minimize_outlined))),
                    ],
                  ),
                ),
              ],
            ),
          ),

        )),
        Container(

          child: Center(child: Text("Total Price: \$ ${_con.calculateTotalCart()}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)),
          height: 40,width: double.infinity,),
      ],
    ));
  }


  // _cartTab() {
  //   return Obx(()=>ListView.builder(
  //     itemCount: _con.localData.length,
  //     itemBuilder: (context, index) => Container(
  //       margin: const EdgeInsets.all(10),
  //       height: 120,
  //       color: Colors.white,
  //       child: Text('Name'),
  //     ),
  //
  //   ));
  // }




// _myGridView(){
  //
  //   return Container(
  //     color: Colors.green,
  //     child: GridView.builder(
  //       itemCount: 10,
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //       ),
  //       itemBuilder: (context, index) => Container(
  //         margin: EdgeInsets.all(5),
  //         color: Colors.red,
  //         height: 200, width: double.infinity,),
  //
  //     ),
  //     height: 1000,
  //     width: double.infinity,
  //   );
  //
  //
  // }













}
