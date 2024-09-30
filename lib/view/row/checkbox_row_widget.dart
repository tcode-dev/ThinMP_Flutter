import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class CheckboxRowWidget extends StatefulWidget {
  final String text;
  final bool initialChecked;
  final ValueChanged<bool> onChanged;

  const CheckboxRowWidget({super.key, required this.text, required this.initialChecked, required this.onChanged});

  @override
  CheckboxRowWidgetState createState() => CheckboxRowWidgetState();
}

class CheckboxRowWidgetState extends State<CheckboxRowWidget> {
  late bool checked;

  @override
  void initState() {
    super.initState();
    checked = widget.initialChecked;
  }

  void _onChanged(bool? value) {
    if (value == null) return;
 
    setState(() {
      checked = value;
    });
 
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: StyleConstant.row.contentBoxHeight,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(right: StyleConstant.padding.small),
      child: Row(
        children: [
          Checkbox(value: checked, onChanged: _onChanged),
          TextWidget(text: widget.text),
        ],
      ),
    );
  }
}
