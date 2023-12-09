import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartRecord extends FirestoreRecord {
  CartRecord._(
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

  // "addedAt" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  bool hasAddedAt() => _addedAt != null;

  // "orderRef" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "sellerRef" field.
  DocumentReference? _sellerRef;
  DocumentReference? get sellerRef => _sellerRef;
  bool hasSellerRef() => _sellerRef != null;

  // "cartRef" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  // "sellerName" field.
  String? _sellerName;
  String get sellerName => _sellerName ?? '';
  bool hasSellerName() => _sellerName != null;

  // "ShopName" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "isShirt" field.
  bool? _isShirt;
  bool get isShirt => _isShirt ?? false;
  bool hasIsShirt() => _isShirt != null;

  // "IsShort" field.
  bool? _isShort;
  bool get isShort => _isShort ?? false;
  bool hasIsShort() => _isShort != null;

  // "isFood" field.
  bool? _isFood;
  bool get isFood => _isFood ?? false;
  bool hasIsFood() => _isFood != null;

  // "IsItem" field.
  bool? _isItem;
  bool get isItem => _isItem ?? false;
  bool hasIsItem() => _isItem != null;

  // "isMerc" field.
  bool? _isMerc;
  bool get isMerc => _isMerc ?? false;
  bool hasIsMerc() => _isMerc != null;

  // "IsOthers" field.
  bool? _isOthers;
  bool get isOthers => _isOthers ?? false;
  bool hasIsOthers() => _isOthers != null;

  // "haveSize" field.
  bool? _haveSize;
  bool get haveSize => _haveSize ?? false;
  bool hasHaveSize() => _haveSize != null;

  // "isSmall" field.
  bool? _isSmall;
  bool get isSmall => _isSmall ?? false;
  bool hasIsSmall() => _isSmall != null;

  // "IsLarge" field.
  bool? _isLarge;
  bool get isLarge => _isLarge ?? false;
  bool hasIsLarge() => _isLarge != null;

  // "isMedium" field.
  bool? _isMedium;
  bool get isMedium => _isMedium ?? false;
  bool hasIsMedium() => _isMedium != null;

  // "isExtraLarge" field.
  bool? _isExtraLarge;
  bool get isExtraLarge => _isExtraLarge ?? false;
  bool hasIsExtraLarge() => _isExtraLarge != null;

  // "isDrink" field.
  bool? _isDrink;
  bool get isDrink => _isDrink ?? false;
  bool hasIsDrink() => _isDrink != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _productCount = castToType<int>(snapshotData['productCount']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _items = getDataList(snapshotData['Items']);
    _isOrdered = snapshotData['is_ordered'] as bool?;
    _shipping = castToType<double>(snapshotData['shipping']);
    _totalPayment = castToType<double>(snapshotData['totalPayment']);
    _products = snapshotData['products'] as DocumentReference?;
    _addedAt = snapshotData['addedAt'] as DateTime?;
    _orderRef = snapshotData['orderRef'] as DocumentReference?;
    _sellerRef = snapshotData['sellerRef'] as DocumentReference?;
    _cartRef = snapshotData['cartRef'] as DocumentReference?;
    _sellerName = snapshotData['sellerName'] as String?;
    _shopName = snapshotData['ShopName'] as String?;
    _isShirt = snapshotData['isShirt'] as bool?;
    _isShort = snapshotData['IsShort'] as bool?;
    _isFood = snapshotData['isFood'] as bool?;
    _isItem = snapshotData['IsItem'] as bool?;
    _isMerc = snapshotData['isMerc'] as bool?;
    _isOthers = snapshotData['IsOthers'] as bool?;
    _haveSize = snapshotData['haveSize'] as bool?;
    _isSmall = snapshotData['isSmall'] as bool?;
    _isLarge = snapshotData['IsLarge'] as bool?;
    _isMedium = snapshotData['isMedium'] as bool?;
    _isExtraLarge = snapshotData['isExtraLarge'] as bool?;
    _isDrink = snapshotData['isDrink'] as bool?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('cart');

  static Stream<CartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CartRecord.fromSnapshot(s));

  static Future<CartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CartRecord.fromSnapshot(s));

  static CartRecord fromSnapshot(DocumentSnapshot snapshot) => CartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCartRecordData({
  DocumentReference? userRef,
  int? productCount,
  double? subtotal,
  bool? isOrdered,
  double? shipping,
  double? totalPayment,
  DocumentReference? products,
  DateTime? addedAt,
  DocumentReference? orderRef,
  DocumentReference? sellerRef,
  DocumentReference? cartRef,
  String? sellerName,
  String? shopName,
  bool? isShirt,
  bool? isShort,
  bool? isFood,
  bool? isItem,
  bool? isMerc,
  bool? isOthers,
  bool? haveSize,
  bool? isSmall,
  bool? isLarge,
  bool? isMedium,
  bool? isExtraLarge,
  bool? isDrink,
  String? image,
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
      'addedAt': addedAt,
      'orderRef': orderRef,
      'sellerRef': sellerRef,
      'cartRef': cartRef,
      'sellerName': sellerName,
      'ShopName': shopName,
      'isShirt': isShirt,
      'IsShort': isShort,
      'isFood': isFood,
      'IsItem': isItem,
      'isMerc': isMerc,
      'IsOthers': isOthers,
      'haveSize': haveSize,
      'isSmall': isSmall,
      'IsLarge': isLarge,
      'isMedium': isMedium,
      'isExtraLarge': isExtraLarge,
      'isDrink': isDrink,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class CartRecordDocumentEquality implements Equality<CartRecord> {
  const CartRecordDocumentEquality();

  @override
  bool equals(CartRecord? e1, CartRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.productCount == e2?.productCount &&
        e1?.subtotal == e2?.subtotal &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.isOrdered == e2?.isOrdered &&
        e1?.shipping == e2?.shipping &&
        e1?.totalPayment == e2?.totalPayment &&
        e1?.products == e2?.products &&
        e1?.addedAt == e2?.addedAt &&
        e1?.orderRef == e2?.orderRef &&
        e1?.sellerRef == e2?.sellerRef &&
        e1?.cartRef == e2?.cartRef &&
        e1?.sellerName == e2?.sellerName &&
        e1?.shopName == e2?.shopName &&
        e1?.isShirt == e2?.isShirt &&
        e1?.isShort == e2?.isShort &&
        e1?.isFood == e2?.isFood &&
        e1?.isItem == e2?.isItem &&
        e1?.isMerc == e2?.isMerc &&
        e1?.isOthers == e2?.isOthers &&
        e1?.haveSize == e2?.haveSize &&
        e1?.isSmall == e2?.isSmall &&
        e1?.isLarge == e2?.isLarge &&
        e1?.isMedium == e2?.isMedium &&
        e1?.isExtraLarge == e2?.isExtraLarge &&
        e1?.isDrink == e2?.isDrink &&
        e1?.image == e2?.image;
  }

  @override
  int hash(CartRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.productCount,
        e?.subtotal,
        e?.items,
        e?.isOrdered,
        e?.shipping,
        e?.totalPayment,
        e?.products,
        e?.addedAt,
        e?.orderRef,
        e?.sellerRef,
        e?.cartRef,
        e?.sellerName,
        e?.shopName,
        e?.isShirt,
        e?.isShort,
        e?.isFood,
        e?.isItem,
        e?.isMerc,
        e?.isOthers,
        e?.haveSize,
        e?.isSmall,
        e?.isLarge,
        e?.isMedium,
        e?.isExtraLarge,
        e?.isDrink,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is CartRecord;
}
