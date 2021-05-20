import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:otlob_task/helpers/base_url.dart';
import 'package:otlob_task/models/categories_model.dart';
import 'package:otlob_task/models/login_model.dart';
import 'package:otlob_task/models/resturant_model.dart';

final categoriesApiProvider = ChangeNotifierProvider<CategoriesApi>((ref) {
  return CategoriesApi();
});

class CategoriesApi extends ChangeNotifier {

  Future<List<CategoriesModel>> getCategoriesNames() async {
    final Response response = await get(Uri.parse(Urls.api + 'getCategories'),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        });
    try {
      if (response.statusCode == 200) {
        // parsing json into List of objects
        print(response.toString());
        final parsed = json.decode(response.body).cast<String, dynamic>();
        print('parsed data = ${parsed['return']}');
        notifyListeners();
        return parsed['return']
            .map<CategoriesModel>((item) => CategoriesModel.fromJson(item))
            .toList();
      }
    } catch (e) {
      print(e);
      return [];
    }
  } // end getCategoriesNames()

  Future<List<Resturant>> getResturants() async {
    final Response response = await get(
        Uri.parse(Urls.api + 'getResturants?langu=ar&catId=1'),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        });
    try {
      if (response.statusCode == 200) {
        // parsing json into List of objects
        //  print('resturant /////////////////');
        //  print(response.toString());
        final parsed = json.decode(response.body).cast<String, dynamic>();
        // print('parsed data = ${parsed['return']}');
        
        notifyListeners();
        return parsed['return']
            .map<Resturant>((item) => Resturant.fromJson(item))
            .toList();
      }
    } catch (e) {
      print(e);
      return [];
    }
  } // end getResturants()

  Future<List<Products>> getFoodItems() async {
    final Response response = await get(
        Uri.parse(Urls.api + 'getResturants?langu=ar&catId=1'),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        });
    try {
      if (response.statusCode == 200) {
        // parsing json into List of objects
        print('resturant /////////////////');
        print(response.toString());
        final parsed = json.decode(response.body).cast<String, dynamic>();
        // print('parsed data = ${parsed['return'][0]['products']}');
        notifyListeners();
        List<Products> productData = [];
        (parsed['return'] as List).forEach((element) {
          productData.addAll(element['products']
              .map<Products>((item) => Products.fromJson(item)));
        });
        print('list = $productData');
        return productData;
      }
    } catch (e) {
      print(e);
      return [];
    }
  } // end getResturants()

  
} // end class CategoriesApi
