import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:otlob_task/widgets/rating_bar.dart';

class ResturantItem extends StatelessWidget {
  final String restName;
  final String restImg;
	final String restLocation;
	final String restType;
  final String delivery ;
  final double rate ;
  ResturantItem({this.restImg, this.restName, 
  this.restLocation, this.restType ,
  this.delivery , this.rate
  });
   
  @override
  Widget build(BuildContext context) {
    print(rate.toString());
    return Container(
      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height * .025 , right: 10 , left: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .17,
     // color: Colors.cyan,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(restName,
                  style: TextStyle(
                    fontFamily: 'Tajawal' ,
                     fontSize: 20 ,
                     fontWeight: FontWeight.bold
                     ),
                     textAlign: TextAlign.right,
                      ),
                     // SizedBox(height: MediaQuery.of(context).size.height * .006,),
                      DisplayRatingBar(rate: rate,itemSize: 12.0,) ,
                      SizedBox(height: MediaQuery.of(context).size.height * .006,),
                      Text(restType,style: TextStyle(
                    fontFamily: 'Tajawal' ,
                     fontSize: 12 ,
                     color: Color(0xff787878)
                     ),
                     textAlign: TextAlign.right,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .006,),
                      Row(
                        children: [
                          Text(restLocation,style: TextStyle(
                    fontFamily: 'Tajawal' ,
                     fontSize: 12 ,
                     color: Color(0xff787878)
                     ),
                     textAlign: TextAlign.right,
                          ),
                          Icon(Icons.location_on , color: Color(0xffAEAEAE),size: 12,) ,
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * .006,),
                        Row(
                          children: [
                            
                            Text(delivery ,style: TextStyle(
                    fontFamily: 'Tajawal' ,
                     fontSize: 12 ,
                     color: Color(0xff787878)
                     ),
                     textAlign: TextAlign.right,
                      ),
                      SizedBox(width:5) ,
                      Icon(Icons.local_shipping , color: Color(0xffAEAEAE),size: 15,),
                          ],
                        ),
                ],
              ),
                 Container(
                  // alignment: Alignment.topCenter,
                   width:118 , height: 80,
                  // color: Colors.grey,
                   margin: EdgeInsets.only( left: 20 ),
                   child: ClipRRect(   
                     borderRadius: BorderRadius.circular(15),
                     child: Image(
                       fit: BoxFit.cover,
                       image: NetworkImage(
                            restImg),
                      ),
                     )
                     ),
            ],
          ),
          Divider(
            color: Color(0xffE4E4E4),
            thickness: 1,
          )
        ],
      ),
    );
  }
}