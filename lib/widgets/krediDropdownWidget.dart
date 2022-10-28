import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediDegisti;
  const KrediDropdownWidget({required this.onKrediDegisti, super.key});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  @override
  double secilenKrediDegeri = 1;
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.4),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (deger) {
          setState(
            () {
              secilenKrediDegeri = deger!;
              widget.onKrediDegisti(secilenKrediDegeri);
            },
          );
        },
        items: DataHelper.tumDerslerinKedileri(),
        underline: Container(),
      ),
    );
  }
}
