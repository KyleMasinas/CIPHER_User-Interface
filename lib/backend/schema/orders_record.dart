import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
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

  // "sellerRef" field.
  DocumentReference? _sellerRef;
  DocumentReference? get sellerRef => _sellerRef;
  bool hasSellerRef() => _sellerRef != null;

  // "isApproved" field.
  bool? _isApproved;
  bool get isApproved => _isApproved ?? false;
  bool hasIsApproved() => _isApproved != null;

  // "orderedAt" field.
  DateTime? _orderedAt;
  DateTime? get orderedAt => _orderedAt;
  bool hasOrderedAt() => _orderedAt != null;

  // "cartRef" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  // "isRejected" field.
  bool? _isRejected;
  bool get isRejected => _isRejected ?? false;
  bool hasIsRejected() => _isRejected != null;

  // "isOrderComplete" field.
  bool? _isOrderComplete;
  bool get isOrderComplete => _isOrderComplete ?? false;
  bool hasIsOrderComplete() => _isOrderComplete != null;

  // "buyerConfirmation" field.
  bool? _buyerConfirmation;
  bool get buyerConfirmation => _buyerConfirmation ?? false;
  bool hasBuyerConfirmation() => _buyerConfirmation != null;

  // "buyerAddress" field.
  String? _buyerAddress;
  String get buyerAddress => _buyerAddress ?? '';
  bool hasBuyerAddress() => _buyerAddress != null;

  // "rejectedAt" field.
  DateTime? _rejectedAt;
  DateTime? get rejectedAt => _rejectedAt;
  bool hasRejectedAt() => _rejectedAt != null;

  // "CompletedAt" field.
  DateTime? _completedAt;
  DateTime? get completedAt => _completedAt;
  bool hasCompletedAt() => _completedAt != null;

  // "buyerName" field.
  String? _buyerName;
  String get buyerName => _buyerName ?? '';
  bool hasBuyerName() => _buyerName != null;

  // "buyerShippingAddress" field.
  String? _buyerShippingAddress;
  String get buyerShippingAddress => _buyerShippingAddress ?? '';
  bool hasBuyerShippingAddress() => _buyerShippingAddress != null;

  // "BuyerPhoneNumber" field.
  String? _buyerPhoneNumber;
  String get buyerPhoneNumber => _buyerPhoneNumber ?? '';
  bool hasBuyerPhoneNumber() => _buyerPhoneNumber != null;

  // "BuyerEmail" field.
  String? _buyerEmail;
  String get buyerEmail => _buyerEmail ?? '';
  bool hasBuyerEmail() => _buyerEmail != null;

  // "BuyerRef" field.
  DocumentReference? _buyerRef;
  DocumentReference? get buyerRef => _buyerRef;
  bool hasBuyerRef() => _buyerRef != null;

  // "pickUpAddress" field.
  String? _pickUpAddress;
  String get pickUpAddress => _pickUpAddress ?? '';
  bool hasPickUpAddress() => _pickUpAddress != null;

  // "paymentOpt" field.
  String? _paymentOpt;
  String get paymentOpt => _paymentOpt ?? '';
  bool hasPaymentOpt() => _paymentOpt != null;

  // "sellerName" field.
  String? _sellerName;
  String get sellerName => _sellerName ?? '';
  bool hasSellerName() => _sellerName != null;

  // "shopName" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "isSmall" field.
  bool? _isSmall;
  bool get isSmall => _isSmall ?? false;
  bool hasIsSmall() => _isSmall != null;

  // "isMedium" field.
  bool? _isMedium;
  bool get isMedium => _isMedium ?? false;
  bool hasIsMedium() => _isMedium != null;

  // "isLarge" field.
  bool? _isLarge;
  bool get isLarge => _isLarge ?? false;
  bool hasIsLarge() => _isLarge != null;

  // "isExtraLarge" field.
  bool? _isExtraLarge;
  bool get isExtraLarge => _isExtraLarge ?? false;
  bool hasIsExtraLarge() => _isExtraLarge != null;

  // "IsFood" field.
  bool? _isFood;
  bool get isFood => _isFood ?? false;
  bool hasIsFood() => _isFood != null;

  // "IsMerc" field.
  bool? _isMerc;
  bool get isMerc => _isMerc ?? false;
  bool hasIsMerc() => _isMerc != null;

  // "IsDrink" field.
  bool? _isDrink;
  bool get isDrink => _isDrink ?? false;
  bool hasIsDrink() => _isDrink != null;

  // "IsOthers" field.
  bool? _isOthers;
  bool get isOthers => _isOthers ?? false;
  bool hasIsOthers() => _isOthers != null;

  // "isItem" field.
  bool? _isItem;
  bool get isItem => _isItem ?? false;
  bool hasIsItem() => _isItem != null;

  // "isShirt" field.
  bool? _isShirt;
  bool get isShirt => _isShirt ?? false;
  bool hasIsShirt() => _isShirt != null;

  // "isShort" field.
  bool? _isShort;
  bool get isShort => _isShort ?? false;
  bool hasIsShort() => _isShort != null;

  // "haveSize" field.
  bool? _haveSize;
  bool get haveSize => _haveSize ?? false;
  bool hasHaveSize() => _haveSize != null;

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
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _sellerRef = snapshotData['sellerRef'] as DocumentReference?;
    _isApproved = snapshotData['isApproved'] as bool?;
    _orderedAt = snapshotData['orderedAt'] as DateTime?;
    _cartRef = snapshotData['cartRef'] as DocumentReference?;
    _isRejected = snapshotData['isRejected'] as bool?;
    _isOrderComplete = snapshotData['isOrderComplete'] as bool?;
    _buyerConfirmation = snapshotData['buyerConfirmation'] as bool?;
    _buyerAddress = snapshotData['buyerAddress'] as String?;
    _rejectedAt = snapshotData['rejectedAt'] as DateTime?;
    _completedAt = snapshotData['CompletedAt'] as DateTime?;
    _buyerName = snapshotData['buyerName'] as String?;
    _buyerShippingAddress = snapshotData['buyerShippingAddress'] as String?;
    _buyerPhoneNumber = snapshotData['BuyerPhoneNumber'] as String?;
    _buyerEmail = snapshotData['BuyerEmail'] as String?;
    _buyerRef = snapshotData['BuyerRef'] as DocumentReference?;
    _pickUpAddress = snapshotData['pickUpAddress'] as String?;
    _paymentOpt = snapshotData['paymentOpt'] as String?;
    _sellerName = snapshotData['sellerName'] as String?;
    _shopName = snapshotData['shopName'] as String?;
    _isSmall = snapshotData['isSmall'] as bool?;
    _isMedium = snapshotData['isMedium'] as bool?;
    _isLarge = snapshotData['isLarge'] as bool?;
    _isExtraLarge = snapshotData['isExtraLarge'] as bool?;
    _isFood = snapshotData['IsFood'] as bool?;
    _isMerc = snapshotData['IsMerc'] as bool?;
    _isDrink = snapshotData['IsDrink'] as bool?;
    _isOthers = snapshotData['IsOthers'] as bool?;
    _isItem = snapshotData['isItem'] as bool?;
    _isShirt = snapshotData['isShirt'] as bool?;
    _isShort = snapshotData['isShort'] as bool?;
    _haveSize = snapshotData['haveSize'] as bool?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
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
  DocumentReference? sellerRef,
  bool? isApproved,
  DateTime? orderedAt,
  DocumentReference? cartRef,
  bool? isRejected,
  bool? isOrderComplete,
  bool? buyerConfirmation,
  String? buyerAddress,
  DateTime? rejectedAt,
  DateTime? completedAt,
  String? buyerName,
  String? buyerShippingAddress,
  String? buyerPhoneNumber,
  String? buyerEmail,
  DocumentReference? buyerRef,
  String? pickUpAddress,
  String? paymentOpt,
  String? sellerName,
  String? shopName,
  bool? isSmall,
  bool? isMedium,
  bool? isLarge,
  bool? isExtraLarge,
  bool? isFood,
  bool? isMerc,
  bool? isDrink,
  bool? isOthers,
  bool? isItem,
  bool? isShirt,
  bool? isShort,
  bool? haveSize,
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
      'name': name,
      'price': price,
      'description': description,
      'sellerRef': sellerRef,
      'isApproved': isApproved,
      'orderedAt': orderedAt,
      'cartRef': cartRef,
      'isRejected': isRejected,
      'isOrderComplete': isOrderComplete,
      'buyerConfirmation': buyerConfirmation,
      'buyerAddress': buyerAddress,
      'rejectedAt': rejectedAt,
      'CompletedAt': completedAt,
      'buyerName': buyerName,
      'buyerShippingAddress': buyerShippingAddress,
      'BuyerPhoneNumber': buyerPhoneNumber,
      'BuyerEmail': buyerEmail,
      'BuyerRef': buyerRef,
      'pickUpAddress': pickUpAddress,
      'paymentOpt': paymentOpt,
      'sellerName': sellerName,
      'shopName': shopName,
      'isSmall': isSmall,
      'isMedium': isMedium,
      'isLarge': isLarge,
      'isExtraLarge': isExtraLarge,
      'IsFood': isFood,
      'IsMerc': isMerc,
      'IsDrink': isDrink,
      'IsOthers': isOthers,
      'isItem': isItem,
      'isShirt': isShirt,
      'isShort': isShort,
      'haveSize': haveSize,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
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
        e1?.description == e2?.description &&
        e1?.sellerRef == e2?.sellerRef &&
        e1?.isApproved == e2?.isApproved &&
        e1?.orderedAt == e2?.orderedAt &&
        e1?.cartRef == e2?.cartRef &&
        e1?.isRejected == e2?.isRejected &&
        e1?.isOrderComplete == e2?.isOrderComplete &&
        e1?.buyerConfirmation == e2?.buyerConfirmation &&
        e1?.buyerAddress == e2?.buyerAddress &&
        e1?.rejectedAt == e2?.rejectedAt &&
        e1?.completedAt == e2?.completedAt &&
        e1?.buyerName == e2?.buyerName &&
        e1?.buyerShippingAddress == e2?.buyerShippingAddress &&
        e1?.buyerPhoneNumber == e2?.buyerPhoneNumber &&
        e1?.buyerEmail == e2?.buyerEmail &&
        e1?.buyerRef == e2?.buyerRef &&
        e1?.pickUpAddress == e2?.pickUpAddress &&
        e1?.paymentOpt == e2?.paymentOpt &&
        e1?.sellerName == e2?.sellerName &&
        e1?.shopName == e2?.shopName &&
        e1?.isSmall == e2?.isSmall &&
        e1?.isMedium == e2?.isMedium &&
        e1?.isLarge == e2?.isLarge &&
        e1?.isExtraLarge == e2?.isExtraLarge &&
        e1?.isFood == e2?.isFood &&
        e1?.isMerc == e2?.isMerc &&
        e1?.isDrink == e2?.isDrink &&
        e1?.isOthers == e2?.isOthers &&
        e1?.isItem == e2?.isItem &&
        e1?.isShirt == e2?.isShirt &&
        e1?.isShort == e2?.isShort &&
        e1?.haveSize == e2?.haveSize &&
        e1?.image == e2?.image;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
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
        e?.description,
        e?.sellerRef,
        e?.isApproved,
        e?.orderedAt,
        e?.cartRef,
        e?.isRejected,
        e?.isOrderComplete,
        e?.buyerConfirmation,
        e?.buyerAddress,
        e?.rejectedAt,
        e?.completedAt,
        e?.buyerName,
        e?.buyerShippingAddress,
        e?.buyerPhoneNumber,
        e?.buyerEmail,
        e?.buyerRef,
        e?.pickUpAddress,
        e?.paymentOpt,
        e?.sellerName,
        e?.shopName,
        e?.isSmall,
        e?.isMedium,
        e?.isLarge,
        e?.isExtraLarge,
        e?.isFood,
        e?.isMerc,
        e?.isDrink,
        e?.isOthers,
        e?.isItem,
        e?.isShirt,
        e?.isShort,
        e?.haveSize,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
