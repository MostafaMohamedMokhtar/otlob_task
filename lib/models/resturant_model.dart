import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resturantDataProvider = ChangeNotifierProvider<Resturant>((ref) {
  return Resturant();
});

class Resturant extends ChangeNotifier {
	String restId;
	String restName;
	String restImg;
	String restLocation;
	String restType;
	int catId;
	double rate;
	int delivery;
	String open;
	String close;
	List<Products> products;

	Resturant({this.restId, this.restName, this.restImg, this.restLocation, this.restType, this.catId, this.rate, this.delivery, this.open, this.close, this.products});

	Resturant.fromJson(Map<String, dynamic> json) {
		restId = json['rest_id'];
		restName = json['rest_name'];
		restImg = json['rest_img'];
		restLocation = json['rest_location'];
		restType = json['rest_type'];
		catId = json['cat_id'];
		rate = json['rate'];
		delivery = json['delivery'];
		open = json['open'];
		close = json['close'];
		if (json['products'] != null) {
			products = <Products>[];
			json['products'].forEach((v) { products.add(new Products.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['rest_id'] = this.restId;
		data['rest_name'] = this.restName;
		data['rest_img'] = this.restImg;
		data['rest_location'] = this.restLocation;
		data['rest_type'] = this.restType;
		data['cat_id'] = this.catId;
		data['rate'] = this.rate;
		data['delivery'] = this.delivery;
		data['open'] = this.open;
		data['close'] = this.close;
		if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
		return data;
	}

}

class Products {
	String prodName;
	int prodId;
	String prodPrice;
	String prodImage;

	Products({this.prodName, this.prodId, this.prodPrice, this.prodImage});

	Products.fromJson(Map<String, dynamic> json) {
		prodName = json['prod_name'];
		prodId = json['prod_id'];
		prodPrice = json['prod_price'];
		prodImage = json['prod_image'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['prod_name'] = this.prodName;
		data['prod_id'] = this.prodId;
		data['prod_price'] = this.prodPrice;
		data['prod_image'] = this.prodImage;
		return data;
	}
}