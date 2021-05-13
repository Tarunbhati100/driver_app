class User {
  String name;
  String email;
  String phoneNumber;
  String password;
  String userId;
  String city;
  bool verify;
  bool profilecomplete;
  String profilephoto;
  String drivinglicense;
  String pancard;
  String vehicleinsurance;
  String rc;
  User({
    this.name,
    this.password,
    this.email,
    this.phoneNumber,
    this.city,
    this.verify,
    this.profilecomplete,
    this.profilephoto,
    this.drivinglicense,
    this.pancard,
    this.vehicleinsurance,
    this.rc,
  });
  User.fromMap(Map<String, dynamic> map) {
    this.name = map["name"] ?? "";
    this.email = map["email"];
    this.phoneNumber = map["phoneNumber"];
    this.password = map["password"];
    this.userId = map["userId"] ?? "";
    this.city = map["city"];
    this.verify = map["verify"];
    this.profilecomplete = map["profilecomplete"];
    this.profilephoto = map["profilephoto"];
    this.drivinglicense = map["drivinglicense"];
    this.pancard = map["pancard"];
    this.vehicleinsurance = map["vehicleinsurance"];
    this.rc = map["rc"];
  }
  toJson(String userId) {
    return {
      "name": this.name,
      "email": this.email,
      "phoneNumber": this.phoneNumber,
      "password": this.password,
      "city": this.city,
      "verify": this.verify,
      "profilecomplete": this.profilecomplete,
      "profilephoto": this.profilephoto,
      "drivinglicense": this.drivinglicense,
      "pancard": this.pancard,
      "vehicleinsurance": this.vehicleinsurance,
      "rc": this.rc
    };
  }
}
