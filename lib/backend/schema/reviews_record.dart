import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reviewname" field.
  String? _reviewname;
  String get reviewname => _reviewname ?? '';
  bool hasReviewname() => _reviewname != null;

  // "reviewDesc" field.
  String? _reviewDesc;
  String get reviewDesc => _reviewDesc ?? '';
  bool hasReviewDesc() => _reviewDesc != null;

  // "userref_Reviewer" field.
  DocumentReference? _userrefReviewer;
  DocumentReference? get userrefReviewer => _userrefReviewer;
  bool hasUserrefReviewer() => _userrefReviewer != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _reviewname = snapshotData['reviewname'] as String?;
    _reviewDesc = snapshotData['reviewDesc'] as String?;
    _userrefReviewer = snapshotData['userref_Reviewer'] as DocumentReference?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _rating = castToType<double>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  String? reviewname,
  String? reviewDesc,
  DocumentReference? userrefReviewer,
  DocumentReference? productRef,
  DateTime? dateCreated,
  double? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reviewname': reviewname,
      'reviewDesc': reviewDesc,
      'userref_Reviewer': userrefReviewer,
      'productRef': productRef,
      'dateCreated': dateCreated,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.reviewname == e2?.reviewname &&
        e1?.reviewDesc == e2?.reviewDesc &&
        e1?.userrefReviewer == e2?.userrefReviewer &&
        e1?.productRef == e2?.productRef &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.reviewname,
        e?.reviewDesc,
        e?.userrefReviewer,
        e?.productRef,
        e?.dateCreated,
        e?.rating
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
