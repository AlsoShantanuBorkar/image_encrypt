import 'dart:convert';

import 'package:objectbox/objectbox.dart';

@Entity()
class EncryptedImageModel {
  @Id()
  int id = 0;
  @Property(type: PropertyType.date)
  final DateTime dateCreated;
  final String imageName;
  final String encryptedImagePath;
  final String originalImagePath;
  final String originalImageExtension;

  EncryptedImageModel({
    required this.dateCreated,
    required this.imageName,
    required this.encryptedImagePath,
    required this.originalImagePath,
    required this.originalImageExtension,
  });

  EncryptedImageModel copyWith({
    int? id,
    DateTime? dateCreated,
    String? imageName,
    String? encryptedImagePath,
    String? originalImagePath,
    String? originalImageExtension,
  }) {
    return EncryptedImageModel(
      dateCreated: dateCreated ?? this.dateCreated,
      imageName: imageName ?? this.imageName,
      encryptedImagePath: encryptedImagePath ?? this.encryptedImagePath,
      originalImagePath: originalImagePath ?? this.originalImagePath,
      originalImageExtension:
          originalImageExtension ?? this.originalImageExtension,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'dateCreated': dateCreated.millisecondsSinceEpoch});
    result.addAll({'imageName': imageName});
    result.addAll({'encryptedImagePath': encryptedImagePath});
    result.addAll({'originalImagePath': originalImagePath});
    result.addAll({'originalImageExtension': originalImageExtension});

    return result;
  }

  factory EncryptedImageModel.fromMap(Map<String, dynamic> map) {
    return EncryptedImageModel(
      dateCreated: DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
      imageName: map['imageName'] ?? '',
      encryptedImagePath: map['encryptedImagePath'] ?? '',
      originalImagePath: map['originalImagePath'] ?? '',
      originalImageExtension: map['originalImageExtension'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EncryptedImageModel.fromJson(String source) =>
      EncryptedImageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EncryptedImageModel(dateCreated: $dateCreated, imageName: $imageName, encryptedImagePath: $encryptedImagePath, originalImagePath: $originalImagePath, originalImageExtension: $originalImageExtension)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EncryptedImageModel &&
        other.dateCreated == dateCreated &&
        other.imageName == imageName &&
        other.encryptedImagePath == encryptedImagePath &&
        other.originalImagePath == originalImagePath &&
        other.originalImageExtension == originalImageExtension;
  }

  @override
  int get hashCode {
    return dateCreated.hashCode ^
        imageName.hashCode ^
        encryptedImagePath.hashCode ^
        originalImagePath.hashCode ^
        originalImageExtension.hashCode;
  }
}
