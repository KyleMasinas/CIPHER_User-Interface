import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reportTitle" field.
  String? _reportTitle;
  String get reportTitle => _reportTitle ?? '';
  bool hasReportTitle() => _reportTitle != null;

  // "ReportDesc" field.
  String? _reportDesc;
  String get reportDesc => _reportDesc ?? '';
  bool hasReportDesc() => _reportDesc != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "prodRef" field.
  DocumentReference? _prodRef;
  DocumentReference? get prodRef => _prodRef;
  bool hasProdRef() => _prodRef != null;

  // "reportedAt" field.
  DateTime? _reportedAt;
  DateTime? get reportedAt => _reportedAt;
  bool hasReportedAt() => _reportedAt != null;

  // "ReportedBy" field.
  String? _reportedBy;
  String get reportedBy => _reportedBy ?? '';
  bool hasReportedBy() => _reportedBy != null;

  // "reportedEmail" field.
  String? _reportedEmail;
  String get reportedEmail => _reportedEmail ?? '';
  bool hasReportedEmail() => _reportedEmail != null;

  // "IsArchive" field.
  bool? _isArchive;
  bool get isArchive => _isArchive ?? false;
  bool hasIsArchive() => _isArchive != null;

  // "ReporterRef" field.
  DocumentReference? _reporterRef;
  DocumentReference? get reporterRef => _reporterRef;
  bool hasReporterRef() => _reporterRef != null;

  void _initializeFields() {
    _reportTitle = snapshotData['reportTitle'] as String?;
    _reportDesc = snapshotData['ReportDesc'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _prodRef = snapshotData['prodRef'] as DocumentReference?;
    _reportedAt = snapshotData['reportedAt'] as DateTime?;
    _reportedBy = snapshotData['ReportedBy'] as String?;
    _reportedEmail = snapshotData['reportedEmail'] as String?;
    _isArchive = snapshotData['IsArchive'] as bool?;
    _reporterRef = snapshotData['ReporterRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? reportTitle,
  String? reportDesc,
  DocumentReference? userRef,
  DocumentReference? prodRef,
  DateTime? reportedAt,
  String? reportedBy,
  String? reportedEmail,
  bool? isArchive,
  DocumentReference? reporterRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reportTitle': reportTitle,
      'ReportDesc': reportDesc,
      'userRef': userRef,
      'prodRef': prodRef,
      'reportedAt': reportedAt,
      'ReportedBy': reportedBy,
      'reportedEmail': reportedEmail,
      'IsArchive': isArchive,
      'ReporterRef': reporterRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.reportTitle == e2?.reportTitle &&
        e1?.reportDesc == e2?.reportDesc &&
        e1?.userRef == e2?.userRef &&
        e1?.prodRef == e2?.prodRef &&
        e1?.reportedAt == e2?.reportedAt &&
        e1?.reportedBy == e2?.reportedBy &&
        e1?.reportedEmail == e2?.reportedEmail &&
        e1?.isArchive == e2?.isArchive &&
        e1?.reporterRef == e2?.reporterRef;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.reportTitle,
        e?.reportDesc,
        e?.userRef,
        e?.prodRef,
        e?.reportedAt,
        e?.reportedBy,
        e?.reportedEmail,
        e?.isArchive,
        e?.reporterRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
