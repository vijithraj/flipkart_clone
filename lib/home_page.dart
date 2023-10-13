import 'package:carousel_slider/carousel_slider.dart';
import 'package:flipkart_clone/buy_page.dart';
import 'package:flipkart_clone/cart_page.dart';
import 'package:flutter/material.dart';

import 'model_class.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPageIndex = 0;
  List Store = [
    ListData(imagepath: "images/airpods1.png", name: "", price: ""),
    ListData(imagepath: "images/airpods2.jpg", name: "", price: ""),
    ListData(imagepath: "images/airpods.png", name: "", price: ""),
    ListData(imagepath: "images/airpods3.png", name: "", price: ""),
  ];
  List Store1 = [
    ListData(imagepath: "images/watch.jpg", name: "", price: ""),
    ListData(imagepath: "images/watch1.png", name: "", price: ""),
    ListData(imagepath: "images/watch2.jpg", name: "", price: ""),
    ListData(imagepath: "images/watch4.jpg", name: "", price: ""),
  ];
  List Store2 = [
    ListData(imagepath: "images/mobile 1.png", name: "", price: ""),
    ListData(imagepath: "images/mobile 2.jpg", name: "", price: ""),
    ListData(imagepath: "images/mobile 3.png", name: "", price: ""),
    ListData(imagepath: "images/mobile 4.png", name: "", price: ""),
  ];
  List Store3 = [
    ListData(imagepath: "images/mobile 1.png", name: "", price: ""),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: [
          const NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          const NavigationDestination(
            icon: Icon(Icons.notification_important_sharp),
            label: 'Notification',
          ),

          GestureDetector(onTap: (){ Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Cart()));},
            child: const NavigationDestination(
              selectedIcon: Icon(Icons.shopping_cart_sharp),
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("flipkart"),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            ListView.builder(
                shrinkWrap: true,
                itemCount: Store3.length,
                itemBuilder: (BuildContext context, int index) {
                  return CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: AssetImage(Store3[index].imagepath),

                          ),
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 100,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  );
                }),
            SizedBox(height: 30,),
            Container(
              color: Colors.cyanAccent,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Best offers",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: Store2.length,
                      itemBuilder: (BuildContext context, int index) {
                        final imageData = Store2[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Buy(imageData: imageData)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(Store2[index].imagepath)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10),
                itemCount: Store.length,
                itemBuilder: (BuildContext ctx, index) {
                  final imageData = Store[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Buy(imageData: imageData)));
                    },
                    child: Container(
                      child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 10,
                          margin:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(Store[index].imagepath),
                                fit: BoxFit.fitWidth,

                              ),
                            ),
                          )),
                    ),
                  );
                }),
            const SizedBox(
              height: 50,
            ),
            Container(
              color: Colors.cyanAccent,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Best Quality",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: Store1.length,
                      itemBuilder: (BuildContext context, int index) {
                        final imageData = Store1[index];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Buy(imageData: imageData)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage(Store1[index].imagepath)),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        );
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
