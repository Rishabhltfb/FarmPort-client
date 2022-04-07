import 'dart:convert';

import 'package:farmport_app/ui/utils/constants/assets.dart';

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

List<CropModel> dummyCropList = [
  CropModel(
      id: '1282982',
      userId: 'asbsb',
      cropName: 'Tomato',
      askingPrice: 43,
      quantity: 29,
      image: FarmPortAssets.tomatoes,
      visibilityStatus: true,
      cropStatus: 'Good',
      cropScore: 7),
  CropModel(
      id: '12s2982',
      userId: 'asbsb',
      cropName: 'Potato',
      askingPrice: 23,
      quantity: 292,
      image: FarmPortAssets.potatoes,
      visibilityStatus: true,
      cropStatus: 'Avg',
      cropScore: 6),
  CropModel(
      id: '12sda82',
      userId: 'asbsb',
      cropName: 'Carrot',
      askingPrice: 38,
      quantity: 41,
      image: FarmPortAssets.carrot,
      visibilityStatus: true,
      cropStatus: 'Good',
      cropScore: 7),
  CropModel(
      id: '128d982',
      userId: 'asbsb',
      cropName: 'Peas',
      askingPrice: 45,
      quantity: 221,
      image: FarmPortAssets.peas,
      visibilityStatus: true,
      cropStatus: 'Bad',
      cropScore: 3),
  CropModel(
      id: '128sg82',
      userId: 'asbsb',
      cropName: 'Rice',
      askingPrice: 40,
      quantity: 127,
      image: FarmPortAssets.rice,
      visibilityStatus: true,
      cropStatus: 'Avg',
      cropScore: 5),
  CropModel(
      id: '128zx82',
      userId: 'asbsb',
      cropName: 'Ginger',
      askingPrice: 81,
      quantity: 91,
      image: FarmPortAssets.ginger,
      visibilityStatus: true,
      cropStatus: 'Good',
      cropScore: 9),
  CropModel(
      id: '1281282',
      userId: 'asbsb',
      cropName: 'Wheat',
      askingPrice: 25,
      quantity: 79,
      image: FarmPortAssets.wheat,
      visibilityStatus: true,
      cropStatus: 'Good',
      cropScore: 8),
];

List<Map<String, String>> cussineList = [
  {"url": FarmPortAssets.tomatoes, 'name': 'tomatoes'},
  {"url": FarmPortAssets.potatoes, 'name': 'potatoes'},
  {"url": FarmPortAssets.peas, 'name': 'peas'},
  {"url": FarmPortAssets.wheat, 'name': 'wheat'},
  {"url": FarmPortAssets.carrot, 'name': 'carrot'},
  {"url": FarmPortAssets.rice, 'name': 'rice'},
  {"url": FarmPortAssets.ginger, 'name': 'ginger'},
];
