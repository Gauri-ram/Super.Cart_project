import 'package:mongo_dart/mongo_dart.dart';
import 'dart:developer';
import 'dart:io';

class MongoDatabase {
  final Db _db;
  MongoDatabase(this._db);

  static connect() async {
    var db = await Db.create(
        "mongodb+srv://gauriramabhadran:root123@cluster0.crrywbw.mongodb.net/Supercart");
    await db.open();
    return MongoDatabase(db);
  }

  Future<bool> checkBarcodeExists(String barcodeID) async {
    var invCollection = _db.collection("inventory");
    var query = where.eq("barcodeID", barcodeID);
    var count = await invCollection.count(query);
    return count > 0;
  }

  Future<void> addToCart(String userEmail, String barcodeID) async {
    var cartCollection = _db.collection("cart");
    // Check if a document with the provided userEmail exists
    var existingDoc =
        await cartCollection.findOne(where.eq("email", userEmail));

    if (existingDoc == null) {
      // If no document exists, create a new one with the provided userEmail
      await cartCollection.insert({
        "email": userEmail,
        "barcodeList": [barcodeID]
      });
    } else {
      // If a document exists, update it to add the new barcodeID to the existing list
      var updatedList = List<String>.from(existingDoc['barcodeList'] ?? []);

      updatedList.add(barcodeID);

      await cartCollection.update(
        where.eq("email", userEmail),
        modify.set("barcodeList", updatedList),
      );
    }
  }

  Future<List<Map<String, dynamic>>> getCartItems(String userEmail) async {
    var cartCollection = _db.collection("cart");
    var query = where.eq("email", userEmail);
    var cartItems = await cartCollection.findOne(query);

    if (cartItems != null) {
      var barcodeIDs = List<String>.from(cartItems['barcodeList'] ?? []);

      var invCollection = _db.collection("inventory");
      var invQuery = where.oneFrom("barcodeID", barcodeIDs);
      var items = await invCollection.find(invQuery).toList();

      return items;
    } else {
      return [];
    }
  }

  Future<void> deleteCartItem(String userEmail, String barcodeID) async {
    var cartCollection = _db.collection("cart");
    var query = where.eq("email", userEmail);
    var update = modify.pull("barcodeList", barcodeID);
    await cartCollection.update(query, update);
  }

  Future<List<Map<String, dynamic>>> getCartData(String userEmail) async {
    var cartCollection = _db.collection("cart");
    var query = where.eq("email", userEmail);
    var cartData = await cartCollection.find(query).toList();
    return cartData;
  }

  Future<void> pushToPurchased(String userEmail, List<dynamic> cartData) async {
    var purchasedCollection = _db.collection("purchased");
    await purchasedCollection
        .insert({"email": userEmail, "barcodeList": cartData});
  }

  Future<void> deleteFromCart(String userEmail) async {
    var cartCollection = _db.collection("cart");
    await cartCollection.remove(where.eq("email", userEmail));
  }
}
