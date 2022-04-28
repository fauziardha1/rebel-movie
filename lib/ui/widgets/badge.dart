part of 'widgets.dart';

class Badge extends StatelessWidget {
  final String text;
  const Badge({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgAccentColor2,
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8.0), bottomLeft: Radius.circular(8.0)),
      ),
      margin: const EdgeInsets.only(
        top: defaultMargin,
        left: defaultMargin,
        right: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 2,
      ),
      child: Text(
        text,
        style: blueAccentFontStyle,
      ),
    );
  }
}
