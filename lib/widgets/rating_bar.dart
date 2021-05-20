import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class DisplayRatingBar extends StatelessWidget {
  final double rate ;
  final double itemSize ;
  DisplayRatingBar({this.rate, this.itemSize});
  @override
  Widget build(BuildContext context) {
    return Container(
    //  color: Colors.cyan,
            width: MediaQuery.of(context).size.width * .5,
      height: MediaQuery.of(context).size.height * .015,
      child: RatingBar.builder(
        itemSize: itemSize ,
        textDirection: TextDirection.rtl,
   initialRating: rate,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
   itemBuilder: (context, _) => Icon(
     Icons.star,
     color: Colors.amber,
     size: 1,
   ),
   onRatingUpdate: (rating) {
     print(rating);
   },
));
  }
}