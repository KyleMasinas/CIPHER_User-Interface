import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OldOrderRecord extends FirestoreRecord {
  OldOrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "UserRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "cost" field.
  double? _cost;
  double get cost => _cost ?? 0.0;
  bool hasCost() => _cost != null;

  // "isAccepted" field.
  bool? _isAccepted;
  bool get isAccepted => _isAccepted ?? false;
  bool hasIsAccepted() => _isAccepted != null;

  // "LastEdited" field.
  DateTime? _lastEdited;
  DateTime? get lastEdited => _lastEdited;
  bool hasLastEdited() => _lastEdited != null;

  // "itemsOrdered" field.
  DocumentReference? _itemsOrdered;
  DocumentReference? get itemsOrdered => _itemsOrdered;
  bool hasItemsOrdered() => _itemsOrdered != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _userRef = snapshotData['UserRef'] as DocumentReference?;
    _cost = castToType<double>(snapshotData['cost']);
    _isAccepted = snapshotData['isAccepted'] as bool?;
    _lastEdited = snapshotData['LastEdited'] as DateTime?;
    _itemsOrdered = snapshotData['itemsOrdered'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('old_order');

  static Stream<OldOrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OldOrderRecord.fromSnapshot(s));

  static Future<OldOrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OldOrderRecord.fromSnapshot(s));

  static OldOrderRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OldOrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OldOrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OldOrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OldOrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OldOrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOldOrderRecordData({
  String? name,
  double? amount,
  String? status,
  DateTime? createdAt,
  DocumentReference? userRef,
  double? cost,
  bool? isAccepted,
  DateTime? lastEdited,
  DocumentReference? itemsOrdered,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'amount': amount,
      'status': status,
      'created_at': createdAt,
      'UserRef': userRef,
      'cost': cost,
      'isAccepted': isAccepted,
      'LastEdited': lastEdited,
      'itemsOrdered': itemsOrdered,
    }.withoutNulls,
  );

  return firestoreData;
}

class OldOrderRecordDocumentEquality implements Equality<OldOrderRecord> {
  const OldOrderRecordDocumentEquality();

  @override
  bool equals(OldOrderRecord? e1, OldOrderRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.amount == e2?.amount &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        e1?.userRef == e2?.userRef &&
        e1?.cost == e2?.cost &&
        e1?.isAccepted == e2?.isAccepted &&
        e1?.lastEdited == e2?.lastEdited &&
        e1?.itemsOrdered == e2?.itemsOrdered;
  }

  @override
  int hash(OldOrderRecord? e) => const ListEquality().hash([
        e?.name,
        e?.amount,
        e?.status,
        e?.createdAt,
        e?.userRef,
        e?.cost,
        e?.isAccepted,
        e?.lastEdited,
        e?.itemsOrdered
      ]);

  @override
  bool isValidKey(Object? o) => o is OldOrderRecord;
}
