import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HarfDropdownWidget extends StatefulWidget {
  final Function onHarfDegisti;
  const HarfDropdownWidget({required this.onHarfDegisti, super.key});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.4),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfDegisti(secilenHarfDegeri);
          });
        },
        items: DataHelper.tumDerslerinHarfleri(),
        underline: Container(),
      ),
    );
  }
}
