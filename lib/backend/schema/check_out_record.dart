import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CheckOutRecord extends FirestoreRecord {
  CheckOutRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "cartref" field.
  DocumentReference? _cartref;
  DocumentReference? get cartref => _cartref;
  bool hasCartref() => _cartref != null;

  void _initializeFields() {
    _cartref = snapshotData['cartref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('checkOut');

  static Stream<CheckOutRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CheckOutRecord.fromSnapshot(s));

  static Future<CheckOutRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CheckOutRecord.fromSnapshot(s));

  static CheckOutRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CheckOutRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CheckOutRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CheckOutRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CheckOutRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CheckOutRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCheckOutRecordData({
  DocumentReference? cartref,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'cartref': cartref,
    }.withoutNulls,
  );

  return firestoreData;
}

class CheckOutRecordDocumentEquality implements Equality<CheckOutRecord> {
  const CheckOutRecordDocumentEquality();

  @override
  bool equals(CheckOutRecord? e1, CheckOutRecord? e2) {
    return e1?.cartref == e2?.cartref;
  }

  @override
  int hash(CheckOutRecord? e) => const ListEquality().hash([e?.cartref]);

  @override
  bool isValidKey(Object? o) => o is CheckOutRecord;
}
