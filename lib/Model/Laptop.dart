class Laptop {
  String company;
  String condition;
  String hDD;
  String model;
  String rAM;
  String ssd;
  String price;
  String? id;
  String? imgurl;

  Laptop(
      {
        this.imgurl,
        this.id,
      required this.company,
      required this.condition,
      required this.hDD,
      required this.model,
      required this.rAM,
      required this.ssd,
      required this.price});

  tojson() {
    return {
      'Model': model,
      'Price': price,
      'Ram': rAM,
      'Ssd': ssd,
      'Company': company,
      'Condition': condition,
    };
  }

  //Map user data from firebase
  factory Laptop.fromSnapshot(Map<String, dynamic> document) {
    // final dataa = document.data()!;
    return Laptop(
        id: document['ID'],
        company: document['Company'] ?? "N/A",
        condition: document['Condition'] ?? "N/A",
        hDD: document['HDD'] ?? "N/A",
        model: document['Model'] ?? "N/A",
        rAM: document['RAM'] ?? "N/A",
        ssd: document['SSD'] ?? "N/A",
        price: document['Price'] ?? "N/A");
  }
}
