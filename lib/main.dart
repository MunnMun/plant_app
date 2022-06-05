import 'package:flutter/material.dart';
import 'plantsList.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(height: 15.0),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  mini: true,
                  elevation: 0.0,
                  child: Icon(Icons.shopping_cart,color: Colors.black,size: 17.0),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(14.0),
            child: Text('Top Picks',style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 40.0,
              fontWeight: FontWeight.w500,
            ),),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text('Top',style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Tab(
                  child: Text('Outdoor',style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Tab(
                  child: Text('Indoor',style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                Tab(
                  child: Text('Plants',style: TextStyle(
                    fontSize: 17.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200.0,
            child: TabBarView(
              controller: tabController,
              children: [
                plantList(),
                plantList(),
                plantList(),
                plantList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


