import 'package:flutter/material.dart';

class FlutterFlowIconButton extends StatefulWidget {
  const FlutterFlowIconButton({
    Key? key,
    required this.icon,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.fillColor,
    this.onPressed,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  final Widget icon;
  final double? borderRadius;
  final double? buttonSize;
  final Color? fillColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showLoadingIndicator;
  final Function()? onPressed;

  @override
  State<FlutterFlowIconButton> createState() => _FlutterFlowIconButtonState();
}

class _FlutterFlowIconButtonState extends State<FlutterFlowIconButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final icon = widget.icon as Icon;
    return Material(
      borderRadius: widget.borderRadius != null
          ? BorderRadius.circular(widget.borderRadius!)
          : null,
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Ink(
        width: widget.buttonSize,
        height: widget.buttonSize,
        decoration: BoxDecoration(
          color: widget.fillColor,
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.borderWidth ?? 0,
          ),
          borderRadius: widget.borderRadius != null
              ? BorderRadius.circular(widget.borderRadius!)
              : null,
        ),
        child: (widget.showLoadingIndicator && loading)
            ? Center(
                child: Container(
                  width: icon.size,
                  height: icon.size,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      icon.color ?? Colors.white,
                    ),
                  ),
                ),
              )
            : IconButton(
                icon: widget.icon,
                onPressed: widget.onPressed == null
                    ? null
                    : () async {
                        if (loading) {
                          return;
                        }
                        setState(() => loading = true);
                        try {
                          await widget.onPressed!();
                        } finally {
                          if (mounted) {
                            setState(() => loading = false);
                          }
                        }
                      },
                splashRadius: widget.buttonSize,
              ),
      ),
    );
  }
}
