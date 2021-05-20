class LoginDataModel {
	int id;
	int age;
	String gender;
	String mobile;
	String password;

	LoginDataModel({this.id, this.age, this.gender, this.mobile, this.password});

	LoginDataModel.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		age = json['age'];
		gender = json['gender'];
		mobile = json['mobile'];
		password = json['password'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['age'] = this.age;
		data['gender'] = this.gender;
		data['mobile'] = this.mobile;
		data['password'] = this.password;
		return data;
	}
}