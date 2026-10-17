import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum SocialType { email, github, linkedin }

class SocialButton extends StatefulWidget {
  final String url;
  final SocialType type;
  final String tooltip;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;

  const SocialButton({
    super.key,
    required this.url,
    required this.type,
    required this.tooltip,
    this.backgroundColor,
    this.iconColor,
    this.size = 48,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  Future<void> _launchUrl() async {
    final uri = Uri.parse(widget.url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (_) {}
  }

  IconData get _icon {
    switch (widget.type) {
      case SocialType.email:
        return Icons.mail_outline_rounded;
      case SocialType.github:
        return Icons.code_rounded;
      case SocialType.linkedin:
        return Icons.work_outline_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: _launchUrl,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                width: widget.size,
                height: widget.size,
                transform: Matrix4.identity()
                  ..translate(0.0, _isHovered ? -3.0 : 0.0)
                  ..scale(_isHovered ? 1.08 : 1.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _isHovered
                        ? [
                            Colors.white.withValues(alpha: 0.35),
                            Colors.white.withValues(alpha: 0.15),
                          ]
                        : [
                            Colors.black.withValues(alpha: 0.65),
                            Colors.black.withValues(alpha: 0.45),
                          ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: _isHovered
                          ? Colors.white.withValues(alpha: 0.25)
                          : Colors.black.withValues(alpha: 0.2),
                      blurRadius: _isHovered ? 16 : 8,
                      offset: Offset(0, _isHovered ? 4 : 2),
                    ),
                  ],
                  border: Border.all(
                    color: _isHovered
                        ? Colors.white.withValues(alpha: 0.85)
                        : Colors.white.withValues(alpha: 0.30),
                    width: 1.2,
                  ),
                ),
                child: Center(
                  child: Icon(
                    _icon,
                    color: Colors.white,
                    size: widget.size * 0.44,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
