import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "student_id_num" field.
  String? _studentIdNum;
  String get studentIdNum => _studentIdNum ?? '';
  bool hasStudentIdNum() => _studentIdNum != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "IsUser" field.
  bool? _isUser;
  bool get isUser => _isUser ?? false;
  bool hasIsUser() => _isUser != null;

  // "IsActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "UserRole" field.
  bool? _userRole;
  bool get userRole => _userRole ?? false;
  bool hasUserRole() => _userRole != null;

  // "AdminRole" field.
  bool? _adminRole;
  bool get adminRole => _adminRole ?? false;
  bool hasAdminRole() => _adminRole != null;

  // "Course" field.
  String? _course;
  String get course => _course ?? '';
  bool hasCourse() => _course != null;

  // "College" field.
  String? _college;
  String get college => _college ?? '';
  bool hasCollege() => _college != null;

  // "form6" field.
  String? _form6;
  String get form6 => _form6 ?? '';
  bool hasForm6() => _form6 != null;

  // "IsNewUser" field.
  bool? _isNewUser;
  bool get isNewUser => _isNewUser ?? false;
  bool hasIsNewUser() => _isNewUser != null;

  // "shopName" field.
  String? _shopName;
  String get shopName => _shopName ?? '';
  bool hasShopName() => _shopName != null;

  // "deactivatedAt" field.
  DateTime? _deactivatedAt;
  DateTime? get deactivatedAt => _deactivatedAt;
  bool hasDeactivatedAt() => _deactivatedAt != null;

  // "IsOnline" field.
  bool? _isOnline;
  bool get isOnline => _isOnline ?? false;
  bool hasIsOnline() => _isOnline != null;

  // "LastOnline" field.
  DateTime? _lastOnline;
  DateTime? get lastOnline => _lastOnline;
  bool hasLastOnline() => _lastOnline != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "BecomeSellerAt" field.
  DateTime? _becomeSellerAt;
  DateTime? get becomeSellerAt => _becomeSellerAt;
  bool hasBecomeSellerAt() => _becomeSellerAt != null;

  // "ShopCreatedAt" field.
  DateTime? _shopCreatedAt;
  DateTime? get shopCreatedAt => _shopCreatedAt;
  bool hasShopCreatedAt() => _shopCreatedAt != null;

  // "ShopPhoto" field.
  String? _shopPhoto;
  String get shopPhoto => _shopPhoto ?? '';
  bool hasShopPhoto() => _shopPhoto != null;

  // "ShopDesc" field.
  String? _shopDesc;
  String get shopDesc => _shopDesc ?? '';
  bool hasShopDesc() => _shopDesc != null;

  // "IsShopCreated" field.
  bool? _isShopCreated;
  bool get isShopCreated => _isShopCreated ?? false;
  bool hasIsShopCreated() => _isShopCreated != null;

  // "prodRef" field.
  DocumentReference? _prodRef;
  DocumentReference? get prodRef => _prodRef;
  bool hasProdRef() => _prodRef != null;

  // "reviewRef" field.
  DocumentReference? _reviewRef;
  DocumentReference? get reviewRef => _reviewRef;
  bool hasReviewRef() => _reviewRef != null;

  // "SoldProd" field.
  int? _soldProd;
  int get soldProd => _soldProd ?? 0;
  bool hasSoldProd() => _soldProd != null;

  // "isNDAAccepted" field.
  bool? _isNDAAccepted;
  bool get isNDAAccepted => _isNDAAccepted ?? false;
  bool hasIsNDAAccepted() => _isNDAAccepted != null;

  // "isTermsAccepted" field.
  bool? _isTermsAccepted;
  bool get isTermsAccepted => _isTermsAccepted ?? false;
  bool hasIsTermsAccepted() => _isTermsAccepted != null;

  // "orderRef" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "cartRef" field.
  DocumentReference? _cartRef;
  DocumentReference? get cartRef => _cartRef;
  bool hasCartRef() => _cartRef != null;

  // "CartLimit" field.
  int? _cartLimit;
  int get cartLimit => _cartLimit ?? 0;
  bool hasCartLimit() => _cartLimit != null;

  // "shippingAddress" field.
  String? _shippingAddress;
  String get shippingAddress => _shippingAddress ?? '';
  bool hasShippingAddress() => _shippingAddress != null;

  // "sales" field.
  int? _sales;
  int get sales => _sales ?? 0;
  bool hasSales() => _sales != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _studentIdNum = snapshotData['student_id_num'] as String?;
    _role = snapshotData['role'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _isUser = snapshotData['IsUser'] as bool?;
    _isActive = snapshotData['IsActive'] as bool?;
    _userRole = snapshotData['UserRole'] as bool?;
    _adminRole = snapshotData['AdminRole'] as bool?;
    _course = snapshotData['Course'] as String?;
    _college = snapshotData['College'] as String?;
    _form6 = snapshotData['form6'] as String?;
    _isNewUser = snapshotData['IsNewUser'] as bool?;
    _shopName = snapshotData['shopName'] as String?;
    _deactivatedAt = snapshotData['deactivatedAt'] as DateTime?;
    _isOnline = snapshotData['IsOnline'] as bool?;
    _lastOnline = snapshotData['LastOnline'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _becomeSellerAt = snapshotData['BecomeSellerAt'] as DateTime?;
    _shopCreatedAt = snapshotData['ShopCreatedAt'] as DateTime?;
    _shopPhoto = snapshotData['ShopPhoto'] as String?;
    _shopDesc = snapshotData['ShopDesc'] as String?;
    _isShopCreated = snapshotData['IsShopCreated'] as bool?;
    _prodRef = snapshotData['prodRef'] as DocumentReference?;
    _reviewRef = snapshotData['reviewRef'] as DocumentReference?;
    _soldProd = castToType<int>(snapshotData['SoldProd']);
    _isNDAAccepted = snapshotData['isNDAAccepted'] as bool?;
    _isTermsAccepted = snapshotData['isTermsAccepted'] as bool?;
    _orderRef = snapshotData['orderRef'] as DocumentReference?;
    _cartRef = snapshotData['cartRef'] as DocumentReference?;
    _cartLimit = castToType<int>(snapshotData['CartLimit']);
    _shippingAddress = snapshotData['shippingAddress'] as String?;
    _sales = castToType<int>(snapshotData['sales']);
    _rating = castToType<double>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? studentIdNum,
  String? role,
  String? photoUrl,
  bool? isUser,
  bool? isActive,
  bool? userRole,
  bool? adminRole,
  String? course,
  String? college,
  String? form6,
  bool? isNewUser,
  String? shopName,
  DateTime? deactivatedAt,
  bool? isOnline,
  DateTime? lastOnline,
  String? address,
  DateTime? becomeSellerAt,
  DateTime? shopCreatedAt,
  String? shopPhoto,
  String? shopDesc,
  bool? isShopCreated,
  DocumentReference? prodRef,
  DocumentReference? reviewRef,
  int? soldProd,
  bool? isNDAAccepted,
  bool? isTermsAccepted,
  DocumentReference? orderRef,
  DocumentReference? cartRef,
  int? cartLimit,
  String? shippingAddress,
  int? sales,
  double? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'student_id_num': studentIdNum,
      'role': role,
      'photo_url': photoUrl,
      'IsUser': isUser,
      'IsActive': isActive,
      'UserRole': userRole,
      'AdminRole': adminRole,
      'Course': course,
      'College': college,
      'form6': form6,
      'IsNewUser': isNewUser,
      'shopName': shopName,
      'deactivatedAt': deactivatedAt,
      'IsOnline': isOnline,
      'LastOnline': lastOnline,
      'address': address,
      'BecomeSellerAt': becomeSellerAt,
      'ShopCreatedAt': shopCreatedAt,
      'ShopPhoto': shopPhoto,
      'ShopDesc': shopDesc,
      'IsShopCreated': isShopCreated,
      'prodRef': prodRef,
      'reviewRef': reviewRef,
      'SoldProd': soldProd,
      'isNDAAccepted': isNDAAccepted,
      'isTermsAccepted': isTermsAccepted,
      'orderRef': orderRef,
      'cartRef': cartRef,
      'CartLimit': cartLimit,
      'shippingAddress': shippingAddress,
      'sales': sales,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.studentIdNum == e2?.studentIdNum &&
        e1?.role == e2?.role &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.isUser == e2?.isUser &&
        e1?.isActive == e2?.isActive &&
        e1?.userRole == e2?.userRole &&
        e1?.adminRole == e2?.adminRole &&
        e1?.course == e2?.course &&
        e1?.college == e2?.college &&
        e1?.form6 == e2?.form6 &&
        e1?.isNewUser == e2?.isNewUser &&
        e1?.shopName == e2?.shopName &&
        e1?.deactivatedAt == e2?.deactivatedAt &&
        e1?.isOnline == e2?.isOnline &&
        e1?.lastOnline == e2?.lastOnline &&
        e1?.address == e2?.address &&
        e1?.becomeSellerAt == e2?.becomeSellerAt &&
        e1?.shopCreatedAt == e2?.shopCreatedAt &&
        e1?.shopPhoto == e2?.shopPhoto &&
        e1?.shopDesc == e2?.shopDesc &&
        e1?.isShopCreated == e2?.isShopCreated &&
        e1?.prodRef == e2?.prodRef &&
        e1?.reviewRef == e2?.reviewRef &&
        e1?.soldProd == e2?.soldProd &&
        e1?.isNDAAccepted == e2?.isNDAAccepted &&
        e1?.isTermsAccepted == e2?.isTermsAccepted &&
        e1?.orderRef == e2?.orderRef &&
        e1?.cartRef == e2?.cartRef &&
        e1?.cartLimit == e2?.cartLimit &&
        e1?.shippingAddress == e2?.shippingAddress &&
        e1?.sales == e2?.sales &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.studentIdNum,
        e?.role,
        e?.photoUrl,
        e?.isUser,
        e?.isActive,
        e?.userRole,
        e?.adminRole,
        e?.course,
        e?.college,
        e?.form6,
        e?.isNewUser,
        e?.shopName,
        e?.deactivatedAt,
        e?.isOnline,
        e?.lastOnline,
        e?.address,
        e?.becomeSellerAt,
        e?.shopCreatedAt,
        e?.shopPhoto,
        e?.shopDesc,
        e?.isShopCreated,
        e?.prodRef,
        e?.reviewRef,
        e?.soldProd,
        e?.isNDAAccepted,
        e?.isTermsAccepted,
        e?.orderRef,
        e?.cartRef,
        e?.cartLimit,
        e?.shippingAddress,
        e?.sales,
        e?.rating
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
