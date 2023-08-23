/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Todo extends _i1.SerializableEntity {
  Todo({
    this.id,
    required this.kategori,
    required this.judul,
    required this.keterangan,
  });

  factory Todo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Todo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      kategori: serializationManager
          .deserialize<String>(jsonSerialization['kategori']),
      judul:
          serializationManager.deserialize<String>(jsonSerialization['judul']),
      keterangan: serializationManager
          .deserialize<String>(jsonSerialization['keterangan']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String kategori;

  String judul;

  String keterangan;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kategori': kategori,
      'judul': judul,
      'keterangan': keterangan,
    };
  }
}
