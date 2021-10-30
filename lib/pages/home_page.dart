import 'package:flutter/material.dart';
import 'package:food_app/animations/fade.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_basket),
            color: Colors.grey[800],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: FadeAnimation(
                      1,
                      Text(
                        'Food delivery',
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        FadeAnimation(
                            1, buildCategory(isActive: true, title: 'Pizza')),
                        FadeAnimation(1,
                            buildCategory(isActive: false, title: 'Burgers')),
                        FadeAnimation(
                            1, buildCategory(isActive: false, title: 'Kebab')),
                        FadeAnimation(
                            1, buildCategory(isActive: false, title: 'Desert')),
                        FadeAnimation(
                            1, buildCategory(isActive: false, title: 'Salad')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Free Delivery',
                  style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    FadeAnimation(
                      2,
                      buildItem(image: 'assets/images/one.jpg', price: '\$4.99', title: 'Strawberry Cake'),
                    ),
                    FadeAnimation(
                      2,
                      buildItem(image: 'assets/images/two.jpeg', price: '\$2.99', title: 'Chocolate Cake'),
                    ),
                    FadeAnimation(
                      2,
                      buildItem(image: 'assets/images/three.jpg', price: '\$6.99', title: 'Burger'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 26,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategory({required bool isActive, required String title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3.0 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildItem({required String image, required String price, required String title}) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2, .9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.favorite, color: Colors.white),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(price, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
                      SizedBox(height: 16),
                      Text(title, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
