import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((element) {
      toplamNot = toplamNot + element.krediDegeri * element.harfDegeri;
      toplamKredi += element.krediDegeri;
    });
    return toplamNot / toplamKredi;
  }

  //ALTTAKI METHODDA HARFLERDEN SAYILARI BULABILMEK ICIN ONCE LISTEYI TANIMLAMAK GEREKIYOR.

  static List<String> _tumDerslerinHarfleri() {
    return ['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD', 'FD', 'FF'];
  }

  ///ALTTAKI YAPIYI OLUSTURABILMEK ICIN BURDAKI METHODA IHTIYACIMIZ VAR
  static double _harfiNotaDCevir(String harf) {
    switch (harf) {
      case 'AA':
        return 4;
      case 'BA':
        return 3.5;
      case 'BB':
        return 3;
      case 'CB':
        return 2.5;
      case 'CC':
        return 2;
      case 'DC':
        return 1.5;
      case 'DD':
        return 1;
      case 'FD':
        return 0.5;
      case 'FF':
        return 0;
      default:
        return 1;
    }
  }

//ICINDE DROPDOWN MENU ITEMLER BULUNAN BIR LISTE OLUSTURDUK.
  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    //GENERIC TIPI VALUE YU TEMSIL EDIYO (DOUBLE)
    return _tumDerslerinHarfleri()
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: _harfiNotaDCevir(e),
            ))
        .toList();
  }

  static List<int> _tumKrediler =
      List.generate(10, (index) => index + 1).toList();

  static List<DropdownMenuItem<double>> tumDerslerinKedileri() {
    return _tumKrediler
        .map(
          (e) => DropdownMenuItem(
            child: Text(
              e.toString(),
            ),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
