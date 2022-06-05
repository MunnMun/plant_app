import 'package:flutter/material.dart';

class plantList extends StatefulWidget {
  const plantList({Key? key}) : super(key: key);

  @override
  State<plantList> createState() => _plantListState();
}

class _plantListState extends State<plantList> {

  late ScrollController _scrollController;

  List allDescriptions = [
    'Aloe vera is a succelent plant of the genus Aloe. I\'ts medicinal uses and air purifying ability make it the plant that you shouldn\'t live without.',
    'Some other description',
    'Third description'
  ];

  late String description;

  @override
  void initState(){
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = allDescriptions[0];
    });
  }

  changedesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value/150).round();
    print(value);
    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            children: [
              getPlantCard('assets/whiteplant.png', '25', 'OUTDOOR', 'Aloe Vera'),
              SizedBox(width: 15.0),
              getPlantCard('assets/smallplant.png', '25', 'INDOOR', 'Ficus'),
              SizedBox(width: 15.0),
              getPlantCard('assets/smallplant.png', '25', 'INDOOR', 'Ficus'),
              SizedBox(width: 15.0),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0,top: 10.0),
          child: Text('Description',style: TextStyle(
            fontSize: 17,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0,top: 10.0,right: 25.0),
          child: Text(description,style: TextStyle(
            fontSize: 12,
            fontFamily: 'Roboto',
          ),),
        ),
      ],
    );
  }

  getPlantCard(String imgPath,String price,String plantType,String plantName){
    return Stack(
      children: [
        Container(
          height: 325.0,
          width: 225.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF399D63),
            ),
            height: 250.0,
            width: 225.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 10.0),
                        Text('FROM',style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4),
                        ),),
                        Text('\$'+price,style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
                Image(
                  image: AssetImage(imgPath),
                  height: 165.0,
                ),
                Row(
                  children: [
                    SizedBox(width: 25.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(plantType,style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF8AC7A4),
                        ),),
                        Text(plantName,style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    SizedBox(width: 25.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF8AC7A4),
                          style: BorderStyle.solid,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xFF399D63),
                      ),
                      child: Icon(Icons.wb_sunny,color: Colors.white.withOpacity(0.4),size: 20.0),
                    ),
                    SizedBox(width: 15.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF8AC7A4),
                          style: BorderStyle.solid,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xFF399D63),
                      ),
                      child: Icon(Icons.branding_watermark,color: Colors.white.withOpacity(0.4),size: 20.0),
                    ),
                    SizedBox(width: 15.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF8AC7A4),
                          style: BorderStyle.solid,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5.0),
                        color: Color(0xFF399D63),
                      ),
                      child: Icon(Icons.hot_tub,color: Colors.white.withOpacity(0.4),size: 20.0),
                    ),
                    SizedBox(width: 15.0),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                            color: Color(0xFF399D63),
                        ),
                        child: Icon(Icons.help_outline,color: Colors.white.withOpacity(0.4),size: 25.0),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 90,top: 300.0),
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.black,
            ),
            child: Center(
              child: Icon(Icons.shopping_cart,color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

}
