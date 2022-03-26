import 'dart:convert';

class CropModel {
  String id;
  String userId;
  String cropName;
  double askingPrice;
  int quantity;
  String image;
  bool visibilityStatus;
  String cropStatus;
  int cropScore;
  CropModel({
    required this.id,
    required this.userId,
    required this.cropName,
    required this.askingPrice,
    required this.quantity,
    required this.image,
    required this.visibilityStatus,
    required this.cropStatus,
    required this.cropScore,
  });

  CropModel copyWith({
    String? id,
    String? userId,
    String? cropName,
    double? askingPrice,
    int? quantity,
    String? image,
    bool? visibilityStatus,
    String? cropStatus,
    int? cropScore,
  }) {
    return CropModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      cropName: cropName ?? this.cropName,
      askingPrice: askingPrice ?? this.askingPrice,
      quantity: quantity ?? this.quantity,
      image: image ?? this.image,
      visibilityStatus: visibilityStatus ?? this.visibilityStatus,
      cropStatus: cropStatus ?? this.cropStatus,
      cropScore: cropScore ?? this.cropScore,
    );
  }

  static CropModel empty() {
    return CropModel(
      id: '',
      askingPrice: 0.0,
      cropName: '',
      cropScore: 0,
      cropStatus: '',
      image: '',
      quantity: 0,
      userId: '',
      visibilityStatus: false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'cropName': cropName,
      'askingPrice': askingPrice,
      'quantity': quantity,
      'image': image,
      'visibilityStatus': visibilityStatus,
      'cropStatus': cropStatus,
      'cropScore': cropScore,
    };
  }

  factory CropModel.fromMap(Map<String, dynamic> map) {
    return CropModel(
      id: map['id'] ?? '',
      userId: map['userId'] ?? '',
      cropName: map['cropName'] ?? '',
      askingPrice: map['askingPrice']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
      image: map['image'] ?? '',
      visibilityStatus: map['visibilityStatus'] ?? false,
      cropStatus: map['cropStatus'] ?? '',
      cropScore: map['cropScore']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CropModel.fromJson(String source) =>
      CropModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CropModel(id: $id, userId: $userId, cropName: $cropName, askingPrice: $askingPrice, quantity: $quantity, image: $image, visibilityStatus: $visibilityStatus, cropStatus: $cropStatus, cropScore: $cropScore)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CropModel &&
        other.id == id &&
        other.userId == userId &&
        other.cropName == cropName &&
        other.askingPrice == askingPrice &&
        other.quantity == quantity &&
        other.image == image &&
        other.visibilityStatus == visibilityStatus &&
        other.cropStatus == cropStatus &&
        other.cropScore == cropScore;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        cropName.hashCode ^
        askingPrice.hashCode ^
        quantity.hashCode ^
        image.hashCode ^
        visibilityStatus.hashCode ^
        cropStatus.hashCode ^
        cropScore.hashCode;
  }
}
