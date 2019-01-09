import 'package:flutter/material.dart';
import 'package:flutter_ui_furniture_app/util.dart';

void main() => runApp(FurnitureApp());

class FurnitureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funiture App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  // Header Màu Vàng ở trên
                  Container(
                    height: 250,
                    color: Color(0XFFFDD148),
                    width: double.infinity,
                  ),

                  //Hình tròn bóng mờ theo vị trí
                  new Positioned(
                    bottom: 50,
                    right: 100,
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                  new Positioned(
                    bottom: 100,
                    left: 150,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),

                  // Content Header
                  Padding(
                    padding: EdgeInsets.only(top: 15, right: 15, left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //avata và buttom menu
                        new Row(
                          children: <Widget>[
                            //Avatar
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                      image: AssetImage('assets/chris.jpg'),
                                    ),
                                    border: Border.all(
                                        color: Colors.white, width: 2)),
                              ),
                            ),
                            Expanded(child: SizedBox()),
                            //Menu Button
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(Icons.menu),
                                color: Colors.white,
                                onPressed: () {},
                                iconSize: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        //Text Name and hello
                        new Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Hello, Huy Nguyen',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'What do you want to buy?',
                            style: TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(height: 30),

                        // Box Search
                        new Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(5),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search,
                                    color: Color(0xFFFEDF62), size: 30),
                                contentPadding:
                                    EdgeInsets.only(left: 15, top: 15),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Quicksand')),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              ),

              //Tab Menu
              Stack(
                children: <Widget>[
                  Material(
                    elevation: 5.0,
                    child: Container(
                      height: 75,
                      color: Colors.white,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _tabCategory(name: 'Sofas', image: 'assets/sofas.png'),
                      _tabCategory(
                          name: 'Wardrobe', image: 'assets/wardrobe.png'),
                      _tabCategory(name: 'Desk', image: 'assets/desks.png'),
                      _tabCategory(
                          name: 'Dresser', image: 'assets/dressers.png'),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10),

              // Item
              _itemCard('FinnVanian', 'assets/ottoman.jpg', true),
              _itemCard('FinnVanian', 'assets/ottoman.jpg', false),
            ],
          )
        ],
      ),
    );
  }

  Widget _tabCategory({String image, String name}) {
    return Container(
      height: 75,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(image))),
          ),
          Text(name, style: TextStyle(fontFamily: 'Quicksand')),
        ],
      ),
    );
  }

  Widget _itemCard(String name, String image, bool isFavorite) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Material(
        elevation: 2.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(
            width: double.infinity,
            child: new Row(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 4.0),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 220,
                        child: Row(
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Material(
                              elevation: isFavorite ? 0 : 2,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: isFavorite
                                      ? Colors.grey.withOpacity(0.2)
                                      : Colors.white,
                                ),
                                child: Center(
                                  child: isFavorite
                                      ? Icon(Icons.favorite_border)
                                      : Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                          width: 175,
                          child: Text(
                              'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.grey,
                                  fontSize: 12))),
                      SizedBox(height: 5.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SizedBox(width: 35.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Container(
                              height: 40,
                              width: 50,
                              color: Color(0xFFF9C335),
                              child: Center(
                                child: Text('\$248',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Quicksand',
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),

                          Container(
                            height: 40.0,
                            width: 100.0,
                            color: Color(0xFFFEDD59),
                            child: Center(
                              child: Text(
                                'Add to cart',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Quicksand',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
