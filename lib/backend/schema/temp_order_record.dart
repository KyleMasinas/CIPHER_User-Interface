import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TempOrderRecord extends FirestoreRecord {
  TempOrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "productCount" field.
  int? _productCount;
  int get productCount => _productCount ?? 0;
  bool hasProductCount() => _productCount != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "Items" field.
  List<DocumentReference>? _items;
  List<DocumentReference> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "is_ordered" field.
  bool? _isOrdered;
  bool get isOrdered => _isOrdered ?? false;
  bool hasIsOrdered() => _isOrdered != null;

  // "shipping" field.
  double? _shipping;
  double get shipping => _shipping ?? 0.0;
  bool hasShipping() => _shipping != null;

  // "totalPayment" field.
  double? _totalPayment;
  double get totalPayment => _totalPayment ?? 0.0;
  bool hasTotalPayment() => _totalPayment != null;

  // "products" field.
  DocumentReference? _products;
  DocumentReference? get products => _products;
  bool hasProducts() => _products != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _productCount = castToType<int>(snapshotData['productCount']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _items = getDataList(snapshotData['Items']);
    _isOrdered = snapshotData['is_ordered'] as bool?;
    _shipping = castToType<double>(snapshotData['shipping']);
    _totalPayment = castToType<double>(snapshotData['totalPayment']);
    _products = snapshotData['products'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('temp_Order');

  static Stream<TempOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TempOrderRecord.fromSnapshot(s));

  static Future<TempOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TempOrderRecord.fromSnapshot(s));

  static TempOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TempOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TempOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TempOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TempOrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TempOrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTempOrderRecordData({
  DocumentReference? userRef,
  int? productCount,
  double? subtotal,
  bool? isOrdered,
  double? shipping,
  double? totalPayment,
  DocumentReference? products,
  String? name,
  double? price,
  String? description,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'productCount': productCount,
      'subtotal': subtotal,
      'is_ordered': isOrdered,
      'shipping': shipping,
      'totalPayment': totalPayment,
      'products': products,
      'name': name,
      'price': price,
      'description': description,
    }.withoutNulls,
  );

  return firestoreData;
}

class TempOrderRecordDocumentEquality implements Equality<TempOrderRecord> {
  const TempOrderRecordDocumentEquality();

  @override
  bool equals(TempOrderRecord? e1, TempOrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.productCount == e2?.productCount &&
        e1?.subtotal == e2?.subtotal &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.isOrdered == e2?.isOrdered &&
        e1?.shipping == e2?.shipping &&
        e1?.totalPayment == e2?.totalPayment &&
        e1?.products == e2?.products &&
        e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description;
  }

  @override
  int hash(TempOrderRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.productCount,
        e?.subtotal,
        e?.items,
        e?.isOrdered,
        e?.shipping,
        e?.totalPayment,
        e?.products,
        e?.name,
        e?.price,
        e?.description
      ]);

  @override
  bool isValidKey(Object? o) => o is TempOrderRecord;
}
