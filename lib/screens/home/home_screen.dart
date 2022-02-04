
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

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
      appBar: AppBar(
        title: Center(child: Text('E-commerce App')),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined)),
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
               child: _homeTab(),

              ),
              Container(
                color: Colors.blueGrey,
                child: Center(child: Text('Category Page')),
              ),
              Container(
                color: Colors.red,
                child: Center(child: Text('Favorite Page')),
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
                icon: Icon(Icons.home),
                label: '${_controller.homePageName.value.toString()}',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ]


        ),

      ),

    );
  }

  Widget _homeTab() {
    return SingleChildScrollView(
      controller: _con.scrollController,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            height: screenWidth/4,
            child: _sliderWidget(),
          ),

          _gridViewContainer(),

        ],
      ),
    );
  }



  _sliderWidget() {

    return CarouselSlider.builder(

        itemCount: 5,
        itemBuilder: (context, index, realIndex) => Container(
          width: screenWidth,
          height: screenWidth/4,
          child: Image.network('https://demo.6amtech.com/grofresh/storage/app/public/banner/2021-06-21-60d0c567e5edd.png',fit: BoxFit.cover, ),
        ),

      options: CarouselOptions(
          enlargeCenterPage: true,
          height: screenWidth/4,
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

    );
  }

  _gridViewContainer() {

    return Expanded(
        child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => Container( height: 200, width: double.infinity,),

        ),

    );
  }

}
