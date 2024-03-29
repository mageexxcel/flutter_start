class AMC {
  final int id;
  final String name;

  AMC(this.id, this.name);

  AMC.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];

  @override
  String toString() {
    return "AMC ID: $id Name: $name";
  }
}
