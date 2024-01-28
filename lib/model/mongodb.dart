import 'package:mongo_dart/mongo_dart.dart';
import 'dart:developer';

class MongoDatabase {
  final Db _db;

  MongoDatabase(this._db);

  static connect() async {
    var db = await Db.create(
        "mongodb+srv://gauriramabhadran:root123@cluster0.crrywbw.mongodb.net/Supercart");
    await db.open();
    return MongoDatabase(db);
  }

  Future<List<Map<String, dynamic>>> getInventoryItems(
      List<String> barcodeIDs) async {
    print("hello");
    print(barcodeIDs);
    var invCollection = _db.collection("inventory");
    var query = where.oneFrom("barcodeID", barcodeIDs);
    var items = await invCollection.find(query).toList();

    return items;
  }

  Future<void> updateItemStatus(String barcodeID, String newStatus) async {
    var invCollection = _db.collection("inventory");
    var query = where.eq("barcodeID", barcodeID);
    var update = modify.set("status", newStatus);
    await invCollection.update(query, update);
  }

  Future<bool> checkBarcodeExists(String barcodeID) async {
    var invCollection = _db.collection("inventory");
    var query = where.eq("barcodeID", barcodeID);
    var count = await invCollection.count(query);
    return count > 0;
  }
}
