import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  //BI TANE CALLBACK FONKSIYON OLUSTURUP HER ELEMAN CIKARILDIGINDA TUM DERSLERDEN SILINMESI ICIN BUNU UST WIDGETTA SILIYORUZ.
  final Function onCikarilanEleman;
  const DersListesi({required this.onCikarilanEleman, super.key});

  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (as) {
                  onCikarilanEleman(index);
                },
                child: Card(
                  child: ListTile(
                    title: Text(tumDersler[index].ad),
                    leading: CircleAvatar(
                      child: Text(
                        (tumDersler[index].harfDegeri *
                                tumDersler[index].krediDegeri)
                            .toStringAsFixed(0),
                      ),
                    ),
                    subtitle: Text(
                        'Kredi Değeri: ${tumDersler[index].krediDegeri},\nNot Değeri: ${tumDersler[index].harfDegeri}'),
                  ),
                ),
              );
            })
        : Container(
            child: Center(
            child: Text(
              'Lütfen Ders Ekleyin',
              style: Sabitler.baslikStyle,
            ),
          ));
  }
}
