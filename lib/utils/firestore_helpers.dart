import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

extension FirestoreDocX on DocumentSnapshot<Map<String, dynamic>> {
  Map<String, dynamic> dataWithId() {
    final data = this.data();
    if (data == null) return {'id': id};
    return {...data, 'id': id};
  }
}

extension FirestoreQueryX on Query<Map<String, dynamic>> {
  Query<Map<String, dynamic>> whereActive() =>
      where('isActive', isEqualTo: true);
}

IconData categoryIconFromName(String iconName) {
  const icons = <String, IconData>{
    'man': Icons.man,
    'man_outlined': Icons.man_outlined,
    'woman': Icons.woman,
    'woman_2_outlined': Icons.woman_2_outlined,
    'child_care_outlined': Icons.child_care_outlined,
    'hiking_outlined': Icons.hiking_outlined,
    'watch_outlined': Icons.watch_outlined,
    'auto_awesome_outlined': Icons.auto_awesome_outlined,
    'checkroom': Icons.checkroom,
    'texture': Icons.texture,
    'style': Icons.style,
    'fabric': Icons.texture,
    'diamond': Icons.diamond,
  };
  return icons[iconName] ?? Icons.category;
}
