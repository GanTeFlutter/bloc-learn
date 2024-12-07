///Firebase Collection isimlerini tutar.
enum FirebaseCollectionName { coffee }

/// Firebase Document isimlerini tutar.
/// ebk: Espresso Bazlı Kahveler
/// sk: Soğuk Kahveler
/// stk: Sütlü Kahveler
enum FirebaseDocumentName { ebk, sk, stk }

///Bu extension ile FirebaseCollectionName enum'ına value adında bir property eklenir.
///Bu property ile FirebaseCollectionName enum'ının değerlerine karşılık gelen string değerler alınabilir.
///Yukarıda name ile alınan değerlerin aksine value ile alınan değerlere kendimiz atama yaptık.Biizm istediğimiz değerleri döndürecek(String).
extension FirebaseDocumentNameExtension on FirebaseDocumentName {
  String get value {
    switch (this) {
      case FirebaseDocumentName.ebk:
        return 'Espresso Bazlı Kahveler';
      case FirebaseDocumentName.sk:
        return 'Soğuk Kahveler';
      case FirebaseDocumentName.stk:
        return 'Sütlü Kahveler';
    }
  }
}
