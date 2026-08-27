import 'package:flutter/services.dart';

class ClipboardService {
  Future<void> copyClipboardText({required String data}) async {
    await Clipboard.setData(ClipboardData(text: data));
  }
}
