part of 'shared.dart';

const double defaultMargin = 15.0;
final Color greyColor = Color(0xff8d92a3);
final Color mainColor = Color(0xff1D1D1D);
final Color accentColor1 = Color(0xffFFE922);
final Color accentColor2 = Color(0xff0FEFFD);
final Color bgAccentColor2 = Color(0xff0FEFFD).withOpacity(0.1);

TextStyle whiteFontStyle = GoogleFonts.roboto().copyWith(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.w700,
);

TextStyle blueAccentFontStyle = GoogleFonts.roboto().copyWith(
  color: accentColor2,
  fontSize: 10,
  fontWeight: FontWeight.w400,
);

TextStyle yellowAccentFontStyle = GoogleFonts.roboto().copyWith(
  color: accentColor1,
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

// greyfontstyle
TextStyle greyFontStyle = GoogleFonts.roboto().copyWith(
  color: greyColor,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

TextStyle blackFontStyle1 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 22,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontStyle2 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
TextStyle blackFontStyle3 = GoogleFonts.poppins().copyWith(
  color: Colors.black,
);

Widget loadingIndicator = Container(
  margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 10),
  child: CircularProgressIndicator(),
);
