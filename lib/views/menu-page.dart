import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inceptionlabs_taskapp/utils/commons.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            topBar(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'What do you like to Order',
                style: TextStyle(color: Colors.black, fontSize: 34, fontWeight: FontWeight.w800),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                itemCard(title: 'Suya', image: 'assets/images/1.PNG'),
                itemCard(title: 'Meals', image: 'assets/images/2.PNG'),
                itemCard(title: 'Sides', image: 'assets/images/3.PNG'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                itemCard(title: 'Shawarma', image: 'assets/images/4.PNG'),
                itemCard(title: 'Drinks', image: 'assets/images/5.PNG'),
                itemCard(title: 'Spices', image: 'assets/images/6.PNG'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trending Orders',
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'View All',
                    style: TextStyle(color: Commons.bgColor, fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Container(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  orderItem(),
                  orderItem(),
                  orderItem(),
                  orderItem(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Container(
      height: 80,
      color: Commons.greyAccent2,
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage('assets/images/logo.PNG'), fit: BoxFit.contain)),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 220,
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'place your order here.',
                  style: TextStyle(color: Commons.greyAccent4, fontSize: 12, fontWeight: FontWeight.w800),
                ),
                Text(
                  'Alhaji Suya pakkam',
                  style: TextStyle(color: Commons.greyAccent5, fontSize: 16, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          Container(
            width: 110,
            height: 40,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(40), border: Border.all(color: Commons.bgColor)),
            child: Text(
              'Take Away',
              style: TextStyle(color: Commons.bgColor, fontSize: 14, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://c.ndtvimg.com/2019-09/7gqbduk8_paneer-steak_625x300_26_September_19.jpg'),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.black12),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 80,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Commons.bgColor)),
                  child: Text(
                    'ADD',
                    style: TextStyle(color: Commons.bgColor, fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 60,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '4.5 ',
                        style: TextStyle(color: Commons.bgColor, fontSize: 14, fontWeight: FontWeight.w800),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: 8,
                  right: 10,
                  child: Icon(
                    CupertinoIcons.heart_circle_fill,
                    color: Colors.green,
                    size: 30,
                  )),
            ],
          ),
          Container(
            height: 40,
            width: 200,
            alignment: Alignment.centerLeft,
            child: Text(
              'Chicken Suya (Boneless)',
              style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w800),
            ),
          )
        ],
      ),
    );
  }

  Widget itemCard({@required String title, @required String image}) {
    return Container(
      height: 180,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 2.0, // soften the shadow
            spreadRadius: 2, //extend the shadow
            offset: Offset(
              1.0, // Move to right 10  horizontally
              1.0, // Move to bottom 10 Vertically
            ),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(
            title,
            style: TextStyle(color: Commons.greyAccent4, fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
