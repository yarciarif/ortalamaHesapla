import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesapla/model/ders.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesapla/widgets/harfDropdownWidget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/krediDropdownWidget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  //FORMA BIR ANAHTAR VERMEK ICIN KEY VERIP GLOBALKEY ILE BAGLIYORUZ.
  var formKey = GlobalKey<FormState>();

  double secilenKrediDegeri = 1;
  double secilenHarfDegeri = 4;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    print('set state calıstı');
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: (AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              Sabitler.titleText,
              style: Sabitler.baslikStyle,
            ),
          ),
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildForm(),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      child: OrtalamaGoster(
                          dersSayisi: DataHelper.tumEklenenDersler.length,
                          ortalama: DataHelper.ortalamaHesapla())),
                ),
              ],
            ),
            //FORM

            Expanded(
              //DERS LISTESINDEKI OLUSTURULAN FONKSIYON ILE ANAYAPIDAKI TUM DERSLERDEN ELEMANI CIKARIP SET STATE ILE BUNU EKRANA GOSTERMIS OLDUK.
              child: DersListesi(onCikarilanEleman: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
                print('Eleman Cıkarıldı. Index:$index');
              }),
            ),

            //LISTE
          ],
        ));
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                    padding: Sabitler.yatayPadding8,
                    child: HarfDropdownWidget(
                      onHarfDegisti: (secilen) {
                        secilenHarfDegeri = secilen;
                      },
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediDropdownWidget(onKrediDegisti: (secilen) {
                    secilenKrediDegeri = secilen;
                  }),
                ),
              ),
              IconButton(
                onPressed: _dersEkleveOrtalamaHesapla,
                icon: Icon(Icons.arrow_forward_ios_sharp),
                color: Sabitler.anaRenk,
                iconSize: 24,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (s) {
        if (s!.length <= 0) {
          return 'Ders Adı Giriniz!';
        } else
          return null;
      },
      decoration: InputDecoration(
          hintText: 'Dersler',
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2)),
    );
  }

  _dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      /* print(DataHelper.tumEklenenDersler); */
      print(DataHelper.ortalamaHesapla());
    }
  }
}
