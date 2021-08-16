import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pretty_json/pretty_json.dart';

Future<List<Transaction>> fetchTransaction() async {
  final response = await http
      .get(Uri.parse('https://banksampah.vercel.app/api/bankTransactions'));
  if (response.statusCode == 200) {
    // printPrettyJson(jsonDecode(response.body));
    List results = jsonDecode(response.body)['results'];
    return results.map((data) => new Transaction.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class Results {
  final Transaction results;

  Results({this.results});

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(results: json['results']);
  }
}

class Category {
  final String id;
  final String name;

  Category({this.id, this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(id: json['_id'], name: json['name']);
  }
}

class Transaction {
  final String id;
  final int stock;
  final String picture;
  final String name;
  final Category category;
  final int price;
  final String status;
  final String description;

  Transaction(
      {this.id,
      this.stock,
      this.picture,
      this.name,
      this.category,
      this.price,
      this.status,
      this.description});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        id: json['_id'],
        stock: json['stock'],
        name: json['name'],
        picture:
            'https://banksampah.vercel.app/api/uploads/' + json['_picture'],
        category: Category.fromJson(json['_category']),
        price: json['price'],
        status: json['status'],
        description: json['desctription']);
  }
}
