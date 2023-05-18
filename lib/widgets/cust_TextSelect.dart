import 'package:flutter/material.dart';
import 'package:productos/constantes.dart';
import 'package:productos/dialogs/app_select_id_dialog.dart';

class CustTextSelect extends StatefulWidget {
  CustTextSelect({super.key, required this.onSelect, required this.hint});
  Function(String) onSelect;
  String hint;

  @override
  State<CustTextSelect> createState() => _CustTextSelectState();
}

class _CustTextSelectState extends State<CustTextSelect> {
  late bool isObscure;

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  var text = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text = widget.hint;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 20,
          child: Text(
            text == widget.hint ? "" : widget.hint,
            style: Medianos(color: kGray, size: 18, letterSpacing: 5),
          ),
        ),
        GestureDetector(
          onTap: () async {
            text = await appSelectIdProductoDialog(context);
            widget.onSelect(text);
            setState(() {});
          },
          child: Container(
              width: MediaQuery.of(context).size.width * .8,
              height: 60,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: kWhite.withOpacity(.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: kGray, width: 3)),
              child: Center(
                child: Text(
                  text,
                  style: Medianos(color: kWhite, size: 18),
                ),
              )),
        ),
      ],
    );
  }
}
