import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '../../flutter_com/flutter_com_util.dart';

class ToDoListRecord extends FirestoreRecord {
  ToDoListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "toDoDate" field.
  DateTime? _toDoDate;
  DateTime? get toDoDate => _toDoDate;
  bool hasToDoDate() => _toDoDate != null;

  // "toDoDescription" field.
  String? _toDoDescription;
  String get toDoDescription => _toDoDescription ?? '';
  bool hasToDoDescription() => _toDoDescription != null;

  // "completedDate" field.
  DateTime? _completedDate;
  DateTime? get completedDate => _completedDate;
  bool hasCompletedDate() => _completedDate != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "toDoName" field.
  String? _toDoName;
  String get toDoName => _toDoName ?? '';
  bool hasToDoName() => _toDoName != null;

  // "CompleteTask" field.
  bool? _completeTask;
  bool get completeTask => _completeTask ?? false;
  bool hasCompleteTask() => _completeTask != null;

  // "QntyPendingTask" field.
  int? _qntyPendingTask;
  int get qntyPendingTask => _qntyPendingTask ?? 0;
  bool hasQntyPendingTask() => _qntyPendingTask != null;

  void _initializeFields() {
    _toDoDate = snapshotData['toDoDate'] as DateTime?;
    _toDoDescription = snapshotData['toDoDescription'] as String?;
    _completedDate = snapshotData['completedDate'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _toDoName = snapshotData['toDoName'] as String?;
    _completeTask = snapshotData['CompleteTask'] as bool?;
    _qntyPendingTask = castToType<int>(snapshotData['QntyPendingTask']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ToDoList');

  static Stream<ToDoListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToDoListRecord.fromSnapshot(s));

  static Future<ToDoListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToDoListRecord.fromSnapshot(s));

  static ToDoListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToDoListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToDoListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToDoListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToDoListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToDoListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToDoListRecordData({
  DateTime? toDoDate,
  String? toDoDescription,
  DateTime? completedDate,
  DocumentReference? user,
  String? toDoName,
  bool? completeTask,
  int? qntyPendingTask,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'toDoDate': toDoDate,
      'toDoDescription': toDoDescription,
      'completedDate': completedDate,
      'user': user,
      'toDoName': toDoName,
      'CompleteTask': completeTask,
      'QntyPendingTask': qntyPendingTask,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToDoListRecordDocumentEquality implements Equality<ToDoListRecord> {
  const ToDoListRecordDocumentEquality();

  @override
  bool equals(ToDoListRecord? e1, ToDoListRecord? e2) {
    return e1?.toDoDate == e2?.toDoDate &&
        e1?.toDoDescription == e2?.toDoDescription &&
        e1?.completedDate == e2?.completedDate &&
        e1?.user == e2?.user &&
        e1?.toDoName == e2?.toDoName &&
        e1?.completeTask == e2?.completeTask &&
        e1?.qntyPendingTask == e2?.qntyPendingTask;
  }

  @override
  int hash(ToDoListRecord? e) => const ListEquality().hash([
        e?.toDoDate,
        e?.toDoDescription,
        e?.completedDate,
        e?.user,
        e?.toDoName,
        e?.completeTask,
        e?.qntyPendingTask
      ]);

  @override
  bool isValidKey(Object? o) => o is ToDoListRecord;
}
