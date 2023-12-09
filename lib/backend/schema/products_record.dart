import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "userref" field.
  DocumentReference? _userref;
  DocumentReference? get userref => _userref;
  bool hasUserref() => _userref != null;

  // "Created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "Stock" field.
  int? _stock;
  int get stock => _stock ?? 0;
  bool hasStock() => _stock != null;

  // "IsArchived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  bool hasIsArchived() => _isArchived != null;

  // "IsSold" field.
  bool? _isSold;
  bool get isSold => _isSold ?? false;
  bool hasIsSold() => _isSold != null;

  // "numOfSold" field.
  int? _numOfSold;
  int get numOfSold => _numOfSold ?? 0;
  bool hasNumOfSold() => _numOfSold != null;

  // "reportRef" field.
  DocumentReference? _reportRef;
  DocumentReference? get reportRef => _reportRef;
  bool hasReportRef() => _reportRef != null;

  // "ShippingFee" field.
  double? _shippingFee;
  double get shippingFee => _shippingFee ?? 0.0;
  bool hasShippingFee() => _shippingFee != null;

  // "paymentOpt" field.
  String? _paymentOpt;
  String get paymentOpt => _paymentOpt ?? '';
  bool hasPaymentOpt() => _paymentOpt != null;

  // "categorOpt" field.
  String? _categorOpt;
  String get categorOpt => _categorOpt ?? '';
  bool hasCategorOpt() => _categorOpt != null;

  // "archived_At" field.
  DateTime? _archivedAt;
  DateTime? get archivedAt => _archivedAt;
  bool hasArchivedAt() => _archivedAt != null;

  // "PickUpAddress" field.
  String? _pickUpAddress;
  String get pickUpAddress => _pickUpAddress ?? '';
  bool hasPickUpAddress() => _pickUpAddress != null;

  // "ratingStar" field.
  double? _ratingStar;
  double get ratingStar => _ratingStar ?? 0.0;
  bool hasRatingStar() => _ratingStar != null;

  // "sellerName" field.
  String? _sellerName;
  String get sellerName => _sellerName ?? '';
  bool hasSellerName() => _sellerName != null;

  // "shopName" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "isFood" field.
  bool? _isFood;
  bool get isFood => _isFood ?? false;
  bool hasIsFood() => _isFood != null;

  // "isMerc" field.
  bool? _isMerc;
  bool get isMerc => _isMerc ?? false;
  bool hasIsMerc() => _isMerc != null;

  // "isItem" field.
  bool? _isItem;
  bool get isItem => _isItem ?? false;
  bool hasIsItem() => _isItem != null;

  // "IsOthers" field.
  bool? _isOthers;
  bool get isOthers => _isOthers ?? false;
  bool hasIsOthers() => _isOthers != null;

  // "HaveSize" field.
  bool? _haveSize;
  bool get haveSize => _haveSize ?? false;
  bool hasHaveSize() => _haveSize != null;

  // "isSmall" field.
  bool? _isSmall;
  bool get isSmall => _isSmall ?? false;
  bool hasIsSmall() => _isSmall != null;

  // "isLarge" field.
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

  // "isShort" field.
  bool? _isShort;
  bool get isShort => _isShort ?? false;
  bool hasIsShort() => _isShort != null;

  // "isShirt" field.
  bool? _isShirt;
  bool get isShirt => _isShirt ?? false;
  bool hasIsShirt() => _isShirt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _brand = snapshotData['brand'] as String?;
    _userref = snapshotData['userref'] as DocumentReference?;
    _createdAt = snapshotData['Created_at'] as DateTime?;
    _stock = castToType<int>(snapshotData['Stock']);
    _isArchived = snapshotData['IsArchived'] as bool?;
    _isSold = snapshotData['IsSold'] as bool?;
    _numOfSold = castToType<int>(snapshotData['numOfSold']);
    _reportRef = snapshotData['reportRef'] as DocumentReference?;
    _shippingFee = castToType<double>(snapshotData['ShippingFee']);
    _paymentOpt = snapshotData['paymentOpt'] as String?;
    _categorOpt = snapshotData['categorOpt'] as String?;
    _archivedAt = snapshotData['archived_At'] as DateTime?;
    _pickUpAddress = snapshotData['PickUpAddress'] as String?;
    _ratingStar = castToType<double>(snapshotData['ratingStar']);
    _sellerName = snapshotData['sellerName'] as String?;
    _shopName = snapshotData['shopName'] as String?;
    _isFood = snapshotData['isFood'] as bool?;
    _isMerc = snapshotData['isMerc'] as bool?;
    _isItem = snapshotData['isItem'] as bool?;
    _isOthers = snapshotData['IsOthers'] as bool?;
    _haveSize = snapshotData['HaveSize'] as bool?;
    _isSmall = snapshotData['isSmall'] as bool?;
    _isLarge = snapshotData['isLarge'] as bool?;
    _isMedium = snapshotData['isMedium'] as bool?;
    _isExtraLarge = snapshotData['isExtraLarge'] as bool?;
    _isDrink = snapshotData['isDrink'] as bool?;
    _isShort = snapshotData['isShort'] as bool?;
    _isShirt = snapshotData['isShirt'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  String? name,
  double? price,
  String? description,
  String? image,
  String? brand,
  DocumentReference? userref,
  DateTime? createdAt,
  int? stock,
  bool? isArchived,
  bool? isSold,
  int? numOfSold,
  DocumentReference? reportRef,
  double? shippingFee,
  String? paymentOpt,
  String? categorOpt,
  DateTime? archivedAt,
  String? pickUpAddress,
  double? ratingStar,
  String? sellerName,
  String? shopName,
  bool? isFood,
  bool? isMerc,
  bool? isItem,
  bool? isOthers,
  bool? haveSize,
  bool? isSmall,
  bool? isLarge,
  bool? isMedium,
  bool? isExtraLarge,
  bool? isDrink,
  bool? isShort,
  bool? isShirt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'description': description,
      'image': image,
      'brand': brand,
      'userref': userref,
      'Created_at': createdAt,
      'Stock': stock,
      'IsArchived': isArchived,
      'IsSold': isSold,
      'numOfSold': numOfSold,
      'reportRef': reportRef,
      'ShippingFee': shippingFee,
      'paymentOpt': paymentOpt,
      'categorOpt': categorOpt,
      'archived_At': archivedAt,
      'PickUpAddress': pickUpAddress,
      'ratingStar': ratingStar,
      'sellerName': sellerName,
      'shopName': shopName,
      'isFood': isFood,
      'isMerc': isMerc,
      'isItem': isItem,
      'IsOthers': isOthers,
      'HaveSize': haveSize,
      'isSmall': isSmall,
      'isLarge': isLarge,
      'isMedium': isMedium,
      'isExtraLarge': isExtraLarge,
      'isDrink': isDrink,
      'isShort': isShort,
      'isShirt': isShirt,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.brand == e2?.brand &&
        e1?.userref == e2?.userref &&
        e1?.createdAt == e2?.createdAt &&
        e1?.stock == e2?.stock &&
        e1?.isArchived == e2?.isArchived &&
        e1?.isSold == e2?.isSold &&
        e1?.numOfSold == e2?.numOfSold &&
        e1?.reportRef == e2?.reportRef &&
        e1?.shippingFee == e2?.shippingFee &&
        e1?.paymentOpt == e2?.paymentOpt &&
        e1?.categorOpt == e2?.categorOpt &&
        e1?.archivedAt == e2?.archivedAt &&
        e1?.pickUpAddress == e2?.pickUpAddress &&
        e1?.ratingStar == e2?.ratingStar &&
        e1?.sellerName == e2?.sellerName &&
        e1?.shopName == e2?.shopName &&
        e1?.isFood == e2?.isFood &&
        e1?.isMerc == e2?.isMerc &&
        e1?.isItem == e2?.isItem &&
        e1?.isOthers == e2?.isOthers &&
        e1?.haveSize == e2?.haveSize &&
        e1?.isSmall == e2?.isSmall &&
        e1?.isLarge == e2?.isLarge &&
        e1?.isMedium == e2?.isMedium &&
        e1?.isExtraLarge == e2?.isExtraLarge &&
        e1?.isDrink == e2?.isDrink &&
        e1?.isShort == e2?.isShort &&
        e1?.isShirt == e2?.isShirt;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.price,
        e?.description,
        e?.image,
        e?.brand,
        e?.userref,
        e?.createdAt,
        e?.stock,
        e?.isArchived,
        e?.isSold,
        e?.numOfSold,
        e?.reportRef,
        e?.shippingFee,
        e?.paymentOpt,
        e?.categorOpt,
        e?.archivedAt,
        e?.pickUpAddress,
        e?.ratingStar,
        e?.sellerName,
        e?.shopName,
        e?.isFood,
        e?.isMerc,
        e?.isItem,
        e?.isOthers,
        e?.haveSize,
        e?.isSmall,
        e?.isLarge,
        e?.isMedium,
        e?.isExtraLarge,
        e?.isDrink,
        e?.isShort,
        e?.isShirt
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
