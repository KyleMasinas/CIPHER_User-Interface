import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

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

  // "userid" field.
  DocumentReference? _userid;
  DocumentReference? get userid => _userid;
  bool hasUserid() => _userid != null;

  // "postid" field.
  DocumentReference? _postid;
  DocumentReference? get postid => _postid;
  bool hasPostid() => _postid != null;

  // "prodImage" field.
  String? _prodImage;
  String get prodImage => _prodImage ?? '';
  bool hasProdImage() => _prodImage != null;

  // "prodRef" field.
  DocumentReference? _prodRef;
  DocumentReference? get prodRef => _prodRef;
  bool hasProdRef() => _prodRef != null;

  // "sellerRef" field.
  DocumentReference? _sellerRef;
  DocumentReference? get sellerRef => _sellerRef;
  bool hasSellerRef() => _sellerRef != null;

  // "orderRef" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "buyerRef" field.
  DocumentReference? _buyerRef;
  DocumentReference? get buyerRef => _buyerRef;
  bool hasBuyerRef() => _buyerRef != null;

  // "sentAt" field.
  DateTime? _sentAt;
  DateTime? get sentAt => _sentAt;
  bool hasSentAt() => _sentAt != null;

  // "readAt" field.
  DateTime? _readAt;
  DateTime? get readAt => _readAt;
  bool hasReadAt() => _readAt != null;

  // "isOrder" field.
  bool? _isOrder;
  bool get isOrder => _isOrder ?? false;
  bool hasIsOrder() => _isOrder != null;

  // "IsReport" field.
  bool? _isReport;
  bool get isReport => _isReport ?? false;
  bool hasIsReport() => _isReport != null;

  // "IsOrderAccepted" field.
  bool? _isOrderAccepted;
  bool get isOrderAccepted => _isOrderAccepted ?? false;
  bool hasIsOrderAccepted() => _isOrderAccepted != null;

  // "isOrderRejected" field.
  bool? _isOrderRejected;
  bool get isOrderRejected => _isOrderRejected ?? false;
  bool hasIsOrderRejected() => _isOrderRejected != null;

  // "receivedBy" field.
  DocumentReference? _receivedBy;
  DocumentReference? get receivedBy => _receivedBy;
  bool hasReceivedBy() => _receivedBy != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _userid = snapshotData['userid'] as DocumentReference?;
    _postid = snapshotData['postid'] as DocumentReference?;
    _prodImage = snapshotData['prodImage'] as String?;
    _prodRef = snapshotData['prodRef'] as DocumentReference?;
    _sellerRef = snapshotData['sellerRef'] as DocumentReference?;
    _orderRef = snapshotData['orderRef'] as DocumentReference?;
    _buyerRef = snapshotData['buyerRef'] as DocumentReference?;
    _sentAt = snapshotData['sentAt'] as DateTime?;
    _readAt = snapshotData['readAt'] as DateTime?;
    _isOrder = snapshotData['isOrder'] as bool?;
    _isReport = snapshotData['IsReport'] as bool?;
    _isOrderAccepted = snapshotData['IsOrderAccepted'] as bool?;
    _isOrderRejected = snapshotData['isOrderRejected'] as bool?;
    _receivedBy = snapshotData['receivedBy'] as DocumentReference?;
    _isRead = snapshotData['isRead'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? title,
  String? description,
  DateTime? timeCreated,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? userid,
  DocumentReference? postid,
  String? prodImage,
  DocumentReference? prodRef,
  DocumentReference? sellerRef,
  DocumentReference? orderRef,
  DocumentReference? buyerRef,
  DateTime? sentAt,
  DateTime? readAt,
  bool? isOrder,
  bool? isReport,
  bool? isOrderAccepted,
  bool? isOrderRejected,
  DocumentReference? receivedBy,
  bool? isRead,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'time_created': timeCreated,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'userid': userid,
      'postid': postid,
      'prodImage': prodImage,
      'prodRef': prodRef,
      'sellerRef': sellerRef,
      'orderRef': orderRef,
      'buyerRef': buyerRef,
      'sentAt': sentAt,
      'readAt': readAt,
      'isOrder': isOrder,
      'IsReport': isReport,
      'IsOrderAccepted': isOrderAccepted,
      'isOrderRejected': isOrderRejected,
      'receivedBy': receivedBy,
      'isRead': isRead,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.userid == e2?.userid &&
        e1?.postid == e2?.postid &&
        e1?.prodImage == e2?.prodImage &&
        e1?.prodRef == e2?.prodRef &&
        e1?.sellerRef == e2?.sellerRef &&
        e1?.orderRef == e2?.orderRef &&
        e1?.buyerRef == e2?.buyerRef &&
        e1?.sentAt == e2?.sentAt &&
        e1?.readAt == e2?.readAt &&
        e1?.isOrder == e2?.isOrder &&
        e1?.isReport == e2?.isReport &&
        e1?.isOrderAccepted == e2?.isOrderAccepted &&
        e1?.isOrderRejected == e2?.isOrderRejected &&
        e1?.receivedBy == e2?.receivedBy &&
        e1?.isRead == e2?.isRead;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.timeCreated,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.userid,
        e?.postid,
        e?.prodImage,
        e?.prodRef,
        e?.sellerRef,
        e?.orderRef,
        e?.buyerRef,
        e?.sentAt,
        e?.readAt,
        e?.isOrder,
        e?.isReport,
        e?.isOrderAccepted,
        e?.isOrderRejected,
        e?.receivedBy,
        e?.isRead
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
