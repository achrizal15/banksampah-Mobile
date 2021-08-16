import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<ProductCategory>> fetchProductCategoryCategory() async {
  final response =
      await http.get(Uri.parse('https://banksampah.vercel.app/api/product'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body)['results'];
    return jsonResponse
        .map((data) => new ProductCategory.fromJson(data))
        .toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class ProductCategory {
  final String id;
  final String name;

  ProductCategory({this.id, this.name});

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(id: json['_id'], name: json['name']);
  }
}
