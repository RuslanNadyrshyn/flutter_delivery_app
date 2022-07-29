class Supplier {
  final int id;
  final String name;
  final String type;
  final String image;
  final WorkingHours? workingHours;

  Supplier(
      {required this.id,
        required this.name,
        required this.type,
        required this.image,
        required this.workingHours});

  factory Supplier.fromJson(Map<String, dynamic> json) {
    return Supplier(
        id: json['id'] as int,
        name: json['name'] as String,
        type: json['type'] as String,
        image: json['image'] as String,
        workingHours: json['workingHours'] != null
            ? WorkingHours.fromJson(json['workingHours'])
            : null);
  }
}

class WorkingHours {
  final String opening;
  final String closing;

  WorkingHours({required this.opening, required this.closing});

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    return WorkingHours(
      opening: json['opening'] as String,
      closing: json['closing'] as String,
    );
  }
}

class SuppliersResponse {
  final List<Supplier> suppliers;
  final List<String> types;

  SuppliersResponse({required this.suppliers, required this.types});

  factory SuppliersResponse.fromJson(Map<String, dynamic> json) {
    return SuppliersResponse(
        suppliers: (json['Suppliers'] as List<dynamic>)
            .map((dynamic e) => Supplier.fromJson(e))
            .toList(),
        types: (json['Types'] as List<dynamic>)
            .map((dynamic e) => e.toString())
            .toList());
  }
}
//
// class SupplierProvider extends ChangeNotifier {
//   List<Supplier> suppliers = [];
//
//   void setSuppliers(List<Supplier> newSuppliers) {
//     suppliers = newSuppliers;
//     notifyListeners();
//   }
// }

