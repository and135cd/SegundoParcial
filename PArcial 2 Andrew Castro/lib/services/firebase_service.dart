

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getTarea() async {
  List tareas = [];
  QuerySnapshot querySnapshot = await db.collection('parcial').get();
  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map tarea = {
      "tarea": data["tarea"],
      "descripcion": data["descripcion"],
      "estado": data["estado"],
      "uid": doc.id,
    };

    tareas.add(tarea);
  }
  return tareas;
}

// Guardar un name en base de datos
Future<void> addTarea(String tarea, String descripcion, bool estado) async {
  await db.collection("parcial").add({"tarea": tarea, "descripcion": descripcion, "estado": estado});
}

// Actualizar un name en base de datos
Future<void> updateTarea(String uid, String tarea, String descripcion, bool estado) async {
  await db.collection("parcial").doc(uid).set({"tarea": tarea, "descripcion": descripcion, "estado": estado});
}

// Borrar datos de Firebase
Future<void> deleteTarea(String uid) async {
  await db.collection("parcial").doc(uid).delete();
}
