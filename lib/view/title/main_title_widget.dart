import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thinmpf/constant/label_constant.dart';
import 'package:thinmpf/constant/style_constant.dart';
import 'package:thinmpf/view/page/main_page_edit_page_widget.dart';
import 'package:thinmpf/view/text/text_widget.dart';

class MainTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback? callback;

  const MainTitleWidget({super.key, required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final top = MediaQuery.of(context).padding.top;

    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(top: top, left: StyleConstant.padding.large),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(text: title, style: Theme.of(context).textTheme.headlineLarge),
            PopupMenuButton(
              onSelected: (item) async {
                if (item == editLabel) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPageEditPageWidget()),
                  );

                  callback?.call();
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: editLabel,
                  child: Text(localizations.edit),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
