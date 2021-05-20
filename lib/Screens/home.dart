import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:otlob_task/Screens/resturant_details.dart';
import 'package:otlob_task/helper/location_helper.dart';
import 'package:otlob_task/models/categories_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otlob_task/models/resturant_model.dart';
import 'package:otlob_task/provider/apis/home_api.dart';
import 'package:otlob_task/widgets/category_name.dart';
import 'package:otlob_task/widgets/resturant_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String address ;
  String deliveryAvailable ;
  @override
  Widget build(BuildContext context) {
    print('Home') ;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        /*  title:
        centerTitle: true, */
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .9,
        color: Colors.white,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .07,
              decoration: BoxDecoration(
                color: Color(0xffffc501),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.search),
                  Text(
                    'الرئيسية',
                    style: TextStyle(
                        color: Color(0xff46200B),
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Tajawal',
                        fontSize: 25),
                  ),
                  Icon(Icons.menu)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .03,
                  horizontal: 10),
              alignment: Alignment.topRight,
              child: Text(
                'مرحبا' '\n' 'عن ماذا تبحث؟',
                style: TextStyle(
                    fontSize: 27,
                    color: Color(0xff46200B),
                    fontFamily: 'Tajawal'),
                textDirection: TextDirection.rtl,
              ),
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: MediaQuery.of(context).size.height * .05,
                child: FutureBuilder<List<CategoriesModel>>(
                    future:
                        context.read(categoriesApiProvider).getCategoriesNames(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print('snapshot of data = ' + snapshot.data.toString());
                        // put this Row widget becuase the Expanded widget must wraped
                        // with Column or Row or Flex
                        return Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, int index) {
                                    print('name = ${snapshot.data[index].name}');
                                    return CategoryName(
                                      name: snapshot.data[index].name,
                                    );
                                  }),
                            ),
                          ],
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * .2,
                child: FutureBuilder<List<Resturant>>(
                    future:
                        context.read(categoriesApiProvider).getResturants(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        print('snapshot of data = ' + snapshot.data.toString());
                        // put this Row widget becuase the Expanded widget must wraped
                        // with Column or Row or Flex
                        return Row(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, int index) {
                                    print('rate = ${snapshot.data[index].rate}');
                                    var coordinates = snapshot.data[index].restLocation.toString().split(',');
                                    final double lat = double.parse(coordinates[0]);
                                    print('lat = $lat');
                                    final double  lng = double.parse(coordinates[1]);
                                    return  FutureBuilder(
                                        future:  LocationHelper.getPlaceAddress(lat, lng),
                                        builder: ( context, locationSnapshot) { 
                                         if(locationSnapshot.hasData){
                                         return GestureDetector(
                                        onTap: (){
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResturantDetails(
                                            restName:snapshot.data[index].restName , 
                                            restImg: snapshot.data[index].restImg ,
                                            restType: snapshot.data[index].restType ,
                                            rate: snapshot.data[index].rate ,
                                            restLocation: locationSnapshot.data.toString(),
                                            delivery: deliveryAvailable,
                                            open: snapshot.data[index].open.toString()
                                            .substring(0 ,snapshot.data[index].open.length - 2 ) ,
                                            close: snapshot.data[index].close.toString()
                                            .substring(0 ,snapshot.data[index].close.length - 2 ) ,
                                          )));
                                        },
                                        child:
                                                ResturantItem(
                                            restName:snapshot.data[index].restName ,
                                            restType:snapshot.data[index].restType ,
                                            restImg: snapshot.data[index].restImg ,
                                            delivery: snapshot.data[index].delivery != 1 
                                            ? deliveryAvailable= 'غير متاح التوصيل'
                                            :deliveryAvailable= ' متاح التوصيل',
                                            rate: snapshot.data[index].rate ,
                                            restLocation: locationSnapshot.data.toString() != ''
                                            ? locationSnapshot.data.toString().substring(0 , 20)
                                            : locationSnapshot.data.toString()
                                            //.substring(0 ,10 )
                                            //getAddress(25.54545454,36.54548878).toString(),
                                           // restLocation : snapshot.data[index].restLocation
                                            ),
                                    );
                                         }else{
                                           return Container(
                                           );
                                         }
                                         },
                                      );
                                  }),
                            ),
                          ],
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
              ),
          ],
        ),
      ),
    );
  } // end build()
  Future<String> getAddress(double lat , double lng) async{
     try {
       List<Placemark> placemarks = await placemarkFromCoordinates(lat , lng );
       print('placemarks = $placemarks');
       Placemark place = placemarks[0];
       address = '${place.locality},${place.street}';
      return address ;
     } catch (e) {
          print('e = $e') ;
          return '' ;
     }
  }
}
