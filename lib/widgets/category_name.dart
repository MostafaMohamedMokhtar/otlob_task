import 'package:flutter/material.dart';

class CategoryName extends StatelessWidget {
  final String name ;
  CategoryName({this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.only(right: 10),
     padding: EdgeInsets.only(top:5),
      width: MediaQuery.of(context).size.width * 0.33,
      height: MediaQuery.of(context).size.height * .05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        //color: Color(0xffEF2823),
        border: Border.all(
          color: Color(0xffEF2823) ,
        )
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: Color(0xffEF2823),
            fontFamily: 'Tajawal',
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
