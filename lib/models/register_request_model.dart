class RegisterRequestModel {
  RegisterRequestModel({
    required this.firstname,
    required this.lastname,
    required this.idNumber,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
  });
  late final String firstname;
  late final String lastname;
  late final String idNumber;
  late final String email;
  late final String password;
  late final String phone;
  late final String address;
  
  RegisterRequestModel.fromJson(Map<String, dynamic> json){
    firstname = json['firstname'];
    lastname = json['lastname'];
    idNumber = json['id_number'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['firstname'] = firstname;
    _data['lastname'] = lastname;
    _data['id_number'] = idNumber;
    _data['email'] = email;
    _data['password'] = password;
    _data['phone'] = phone;
    _data['address'] = address;
    return _data;
  }
}