import 'package:flutter/material.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class CheckboxRowWidget extends StatefulWidget {
  final String title;
  final bool initialChecked;

  const CheckboxRowWidget({super.key, required this.title, required this.initialChecked});

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

  void _handleCheckbox(bool? value) {
    setState(() {
      checked = value!;
    });
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
          Checkbox(value: checked, onChanged: _handleCheckbox),
          TextWidget(text: widget.title),
        ],
      ),
    );
  }
}
