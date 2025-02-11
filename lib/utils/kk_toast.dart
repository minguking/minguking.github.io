import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

enum KKToastLocation { top, bottom }

class KKToast {
  static OverlayEntry? _overlayEntry;
  static bool _isShowing = false; // 현재 토스트가 표시 중인지 체크

  static void show(
      String msg,
      BuildContext context, {
        KKToastLocation location = KKToastLocation.bottom,
      }) {
    Color textColor = Colors.white;
    Color backgroundColor = KKColor.grey;

    // 기존 토스트가 있으면 즉시 제거
    dismiss();

    _createView(msg, location, context, backgroundColor, textColor);
  }

  static void _createView(
      String msg,
      KKToastLocation location,
      BuildContext context,
      Color background,
      Color textColor,
      ) {
    var overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (BuildContext context) => _KKToastAnimatedWidget(
        message: msg,
        location: location,
        background: background,
        onDismiss: dismiss,
      ),
    );

    _isShowing = true;
    overlayState.insert(_overlayEntry!);
  }

  /// 즉시 제거
  static void dismiss() {
    if (_isShowing) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isShowing = false;
    }
  }
}

class _KKToastAnimatedWidget extends StatefulWidget {
  const _KKToastAnimatedWidget({
    required this.message,
    this.location = KKToastLocation.bottom,
    required this.background,
    required this.onDismiss,
    super.key,
  });

  final String message;
  final KKToastLocation location;
  final Color background;
  final VoidCallback onDismiss;

  @override
  _KKToastWidgetState createState() => _KKToastWidgetState();
}

class _KKToastWidgetState extends State<_KKToastAnimatedWidget>
    with SingleTickerProviderStateMixin {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    // 개별적으로 동작하는 타이머 설정
    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });

        // 애니메이션이 끝난 후 dismiss()
        Future.delayed(Duration(milliseconds: 500), () {
          if (mounted) widget.onDismiss();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.location == KKToastLocation.top ? 90 : null,
      bottom: widget.location == KKToastLocation.bottom ? 90 : null,
      left: 0,
      right: 0,
      child: GestureDetector(
        onTap: widget.onDismiss, // 클릭하면 즉시 dismiss
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 500),
          opacity: _isVisible ? 1.0 : 0.0,
          child: Center(
            // 화면 중앙 정렬
            child: Column(
              mainAxisSize: MainAxisSize.min, // 토스트 크기를 텍스트 크기에 맞춤
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: widget.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    widget.message,
                    softWrap: true,
                    style: TextStyle(
                      fontFamily: KKFont.pretendardRegular,
                      decoration: TextDecoration.none, // 밑줄 제거
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
