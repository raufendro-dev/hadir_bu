import 'dart:convert';

List<Usersimpan> storeFromJson(String str) =>
    List<Usersimpan>.from(json.decode(str).map((x) => Usersimpan.fromJson(x)));

String storeToJson(List<Usersimpan> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usersimpan {
  var id;
  var username;
  var password;
  var fullname;
  var gambar;

  Usersimpan(
      {this.id, this.username, this.password, this.fullname, this.gambar});

  // Convert a Toko into a Map. The keys must correspond to the names of the
  // columns in the database.

  factory Usersimpan.fromJson(Map<String, dynamic> json) => Usersimpan(
      id: json["id"],
      username: json["username"],
      password: json["password"],
      fullname: json["fullname"],
      gambar: json["gambar"]);
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "fullname": fullname,
        "gambar": gambar
      };

  // Implement toString to make it easier to see information about
  // each toko when using the print statement.

}
