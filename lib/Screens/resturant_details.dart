import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:otlob_task/models/resturant_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otlob_task/provider/apis/home_api.dart';
import 'package:otlob_task/widgets/meal_item.dart';
import 'package:otlob_task/widgets/rating_bar.dart';

class ResturantDetails extends StatelessWidget {
  final String restName;
  final String restImg;
  final String restLocation;
  final String restType;
  final String delivery;
  final String open ;
  final String close ;
  final double rate ;

  ResturantDetails(
      {this.restName,
      this.restImg,
      this.restType,
      this.restLocation,
      this.delivery, this.open, this.close, this.rate});
  @override
  Widget build(BuildContext context) {
    // initializeDateFormatting("ar", null);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Colors.amber[100],
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
              color: Colors.teal,
              child: Stack(
                //textDirection: TextDirection.rtl,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7), BlendMode.dstATop),
                        image: NetworkImage(restImg),
                      ),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * .02,
                    top: MediaQuery.of(context).size.height * .06,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios,
                                size: 24, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15 , ),
                          child: Text(
                            restName,
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Tajawal',
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ) , 
                        Container(
                          margin: EdgeInsets.only(right: 10 ),
                          child: DisplayRatingBar(rate: rate , itemSize: 17,),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0.0,
              left: 0.0,
              bottom: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .75,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.7, 0.7),
                      spreadRadius: 0.5,
                      blurRadius: 16.0,
                    ),
                  ],
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    right: 15,
                    left: 15,
                    top: MediaQuery.of(context).size.height * .04,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        restType,
                        style: TextStyle(
                          fontFamily: 'Tajawal',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff46200B),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .015,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            restLocation,
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 19,
                                color: Color(0xff787878)),
                            textAlign: TextAlign.right,
                          ),
                          Icon(
                            Icons.location_on,
                            color: Color(0xffEF2823),
                            size: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                        child: Divider(
                          color: Color(0xffE4E4E4),
                          thickness: .5,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .01),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                                                       Text(
                              'مفتوح',
                              style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 18,
                                  color: Color(0xff0DBF00)),
                              textAlign: TextAlign.right,
                            ),
                            Icon(
                              Icons.circle,
                              color: Color(0xff0DBF00),
                              size: 17,
                            ),
                            Text(
                              '  ص${open} من - ',
                             // ' ${DateFormat("hh a", 'ar').parse(close)}  إلى ${DateFormat("hh a", 'ar').parse(open)} من - ',
                              style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 18,
                                  color: Color(0xff575757)),
                              //textAlign: TextAlign.right,
                            ),
                             Text(
                              ' ${close}  إلى  ',
                              
                             // ' ${DateFormat("hh a", 'ar').parse(close)}  إلى ${DateFormat("hh a", 'ar').parse(open)} من - ',
                              style: TextStyle(
                                  fontFamily: 'Tajawal',
                                  fontSize: 18,
                                  color: Color(0xff575757)),
                              textAlign: TextAlign.right,
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .006,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            delivery,
                            style: TextStyle(
                                fontFamily: 'Tajawal',
                                fontSize: 18,
                                color: Color(0xff787878)),
                            textAlign: TextAlign.right,
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.local_shipping,
                            color: Color(0xffAEAEAE),
                            size: 28,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .03,
                        child: Divider(
                          color: Color(0xffE4E4E4),
                          thickness: .5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'الأصناف',
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Tajawal',
                              color: Color(0xff46200B)),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      ///////////////////////////
                      Expanded(
                        child: Container(
                        //  color: Colors.amber[100],
                          height: MediaQuery.of(context).size.height ,
                          child: FutureBuilder<List<Products>>(
                              future: context
                                  .read(categoriesApiProvider)
                                  .getFoodItems(),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.hasData) {
                                  print('snapshot of data = ' +
                                      snapshot.data.toString());
                                  // put this Row widget becuase the Expanded widget must wraped
                                  // with Column or Row or Flex
                                  return GridView.builder(    
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2  ,
                                      mainAxisSpacing: MediaQuery.of(context).size.height * .03,
                                      crossAxisSpacing: MediaQuery.of(context).size.width * .05
                                      ),
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, int index) {
                                        return GestureDetector(
                                          onTap: () {
                                          },
                                          child:  MealItem(
                                                    prodImage: snapshot.data[index].prodImage ,
                                                    prodName: snapshot.data[index].prodName,
                                                    prodPrice: snapshot.data[index].prodPrice,
                                                  ),
                                        );
                                      }, );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
