import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyableText extends StatefulWidget {
  final String text;
  final Widget child;
  const CopyableText({super.key, required this.text, required this.child});

  @override
  State<CopyableText> createState() => _CopyableTextState();
}

class _CopyableTextState extends State<CopyableText> {
  final GlobalKey globalKey = GlobalKey();
  OverlayEntry? _overlayEntry;

  void _showCopyBox() {
    _overlayEntry = _showOverlay();
    Overlay.of(context).insert(_overlayEntry!);
    Future.delayed(Duration(seconds: 3), () {
      _removeOverlay();
    });
  }

  OverlayEntry _showOverlay() {
    final RenderBox renderBox =
        globalKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    final Size size = renderBox.size;

    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: position.dy + size.height + 5,
          right: MediaQuery.of(context).size.width - (position.dx + size.width),
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: widget.text));
                _removeOverlay();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Copied')));
              },
              child: Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.black12, width: 0.5),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Text(
                  ' copy ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: 'Montono',
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _showCopyBox();
      },
      child: Container(key: globalKey, child: widget.child),
    );
  }
}
