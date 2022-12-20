import 'package:kamn/presentation/shared/toast_helper.dart';
import 'package:url_launcher/url_launcher.dart';

void launchMapsUrl(double lat, double lon) async {
  final Uri url =
      Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lon');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    showToast("Can't launch Google maps");
  }
}
