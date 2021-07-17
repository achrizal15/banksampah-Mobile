import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<HttpProducts>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new HttpProducts.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class HttpProducts {
  String id, title, price, image;
  HttpProducts({this.id, this.title, this.price, this.image});
  factory HttpProducts.fromJson(Map<String, dynamic> json) {
    return HttpProducts(
        id: json['id'].toString(),
        title: json['title'],
        price: json['price'].toString(),
        image: json['image']);
  }
}
