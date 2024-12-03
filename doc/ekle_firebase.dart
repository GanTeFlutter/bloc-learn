// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'view_model.dart';

///Firebase modelimi elle girmek yerine onu chatGpt ile olusturdum
//sonrada alltaki fonksiyon ile json verisini firebase'e yukledim
//en az 1 saatim giderdi elle girsem

//Ekledikten sonra lib den kaldırım
class EkleFirebase extends StatefulWidget {
  const EkleFirebase({super.key});

  @override
  State<EkleFirebase> createState() => _EkleFirebaseState();
}

class _EkleFirebaseState extends EkleViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EkleFirebase'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                uploadJsonToFirestorre();
              },
              child: const Text("Verileri Firebase'e Yükle"),
            ),
          ],
        ),
      ),
    );
  }
}
