import 'package:flutter/material.dart';
class MealItem extends StatelessWidget {
  final String prodImage ;
  final String prodName ;
  final String prodPrice ;
  

  const MealItem({this.prodImage, this.prodName, this.prodPrice}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width * .4 ,
      height:MediaQuery.of(context).size.height * .35 ,
      decoration: BoxDecoration(
        //color: Colors.cyan[100]  ,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black12 , width: .5 )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(topRight:Radius.circular(15) 
              ,topLeft:Radius.circular(15)  ),
              child: Image(
                height: MediaQuery.of(context).size.height * .14,
                image: NetworkImage(prodImage),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height * .01),
           Container(
             margin: EdgeInsets.symmetric(horizontal: 15),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
               children: [
                  Text(prodName , style: TextStyle(
              color: Color(0xff46200B),
              fontSize: 15 ,
              fontFamily: 'Tajawal'
            ),
            textAlign: TextAlign.right,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.add_shopping_cart , color: Color(0xffEF2823),),
                Text('${prodPrice} ج.م ' , style: TextStyle(
                  fontSize: 15 ,
                  fontFamily: 'Tajawal' ,
                  color: Color(0xff787878),
                ),) ,
              ],
            ),
               ],
             ),
           )
          ],
        ),
    );
  }
}