import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:wave_money_code_test/const/style/style.dart';

class InstructionsHtmlWidget extends StatelessWidget {
  final String instructionsHtml;
  final String title;

  const InstructionsHtmlWidget(
      {super.key, required this.instructionsHtml, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: appBarTextStyle,
        ),
        Html(
          data: instructionsHtml,
          style: {
            'li': Style(
              fontSize: FontSize(14.0),
              padding: HtmlPaddings.zero,
              margin: Margins.only(bottom: 8.0),
            ),
            'ol': Style(
              padding: HtmlPaddings.only(left: 16.0, right: 16.0),
            ),
          },
        ),
      ],
    );
  }
}
