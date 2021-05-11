class User {
  String name;
  String email;
  String phoneNumber;
  String password;
  String userId;
  String city;
  bool verfiy;
  bool profilecomplete;
  User(
      {this.name,
      this.password,
      this.email,
      this.phoneNumber,
      this.city,
      this.verfiy,
      this.profilecomplete});
  User.fromMap(Map<String, dynamic> map) {
    this.name = map["name"] ?? "";
    this.email = map["email"];
    this.phoneNumber = map["phoneNumber"];
    this.password = map["password"];
    this.userId = map["userId"] ?? "";
    this.city = map["city"];
    this.verfiy = map["verify"];
    this.profilecomplete = map["profilecomplete"];
  }
  toJson(String userId) {
    return {
      "name": this.name,
      "email": this.email,
      "phoneNumber": this.phoneNumber,
      "password": this.password,
      "city": this.city,
      "verify": this.verfiy,
      "profilecomplete": this.profilecomplete,
    };
  }
}
