//sachin kumara Liyanage
//IT17152938
class Medicine{
  String id="";
  String name;
  String details;
  String date="";
  String email="";
  Medicine(this.id, this.name, this.details, this.date,this.email);

  Medicine.fromMap(Map snapshot,String id) :
        id = id ?? '',
        name = snapshot['name'] ?? '',
        details = snapshot['details'] ?? '',
        date = snapshot['date'] ?? '',
        email = snapshot['email'] ?? '';

  toJson() {
    return {
      "name": name,
      "details": details,
      "date": date,
      "email":email,
    };
  }

}

