class UserModel {
  late String name;
  late String? email;

  UserModel(this.name, this.email);

  UserModel.fromJson(var user) {
    this.email = user['email'];
    this.name = user['user_name'];
  }
}
