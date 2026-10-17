import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/portfolio_data.dart';
import '../theme/theme_provider.dart';
import 'social_button.dart';

class ContactSection extends StatefulWidget {
  final ThemeProvider themeProvider;

  const ContactSection({
    super.key,
    required this.themeProvider,
  });

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isCopied = false;
  bool _formSubmitted = false;

  void _copyEmail() {
    Clipboard.setData(ClipboardData(text: portfolioData.contact.email));
    setState(() => _isCopied = true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email copied to clipboard: ${portfolioData.contact.email}'),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF10B981),
      ),
    );
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _isCopied = false);
    });
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _formSubmitted = true);
      Future.delayed(const Duration(seconds: 4), () {
        if (mounted) {
          setState(() {
            _formSubmitted = false;
            _nameController.clear();
            _emailController.clear();
            _messageController.clear();
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.themeProvider.isDark(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;

    final bgColor = isDark ? const Color(0xFF000000) : const Color(0xFFFFFFFF);
    final cardBgColor = isDark ? const Color(0xFF0E0E0E) : const Color(0xFFF8F9FA);
    final borderColor = isDark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.08);
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subtextColor = isDark ? Colors.white70 : const Color(0xFF475569);
    final mutedColor = isDark ? Colors.white38 : const Color(0xFF94A3B8);

    return Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64 : 24,
        vertical: isDesktop ? 120 : 80,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: _buildContactInfo(textColor, subtextColor, mutedColor, cardBgColor, borderColor, isDark),
                    ),
                    const SizedBox(width: 64),
                    Expanded(
                      flex: 7,
                      child: _buildContactForm(cardBgColor, borderColor, textColor, subtextColor, isDark),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildContactInfo(textColor, subtextColor, mutedColor, cardBgColor, borderColor, isDark),
                    const SizedBox(height: 48),
                    _buildContactForm(cardBgColor, borderColor, textColor, subtextColor, isDark),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(
    Color textColor,
    Color subtextColor,
    Color mutedColor,
    Color cardBgColor,
    Color borderColor,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Availability Pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withOpacity(0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: const Color(0xFF10B981).withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF10B981),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                portfolioData.contact.availability,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF10B981),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Text(
          portfolioData.contact.heading,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: textColor,
            letterSpacing: -1.2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          portfolioData.contact.description,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            color: subtextColor,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),

        // Direct Email Card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cardBgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: textColor.withOpacity(0.06),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.mail_outline_rounded, size: 20, color: textColor),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DIRECT EMAIL',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              color: mutedColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            portfolioData.contact.email,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  _GlassCopyEmailButton(
                    isCopied: _isCopied,
                    onTap: _copyEmail,
                    isDark: isDark,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Divider(color: borderColor, height: 1),
              const SizedBox(height: 14),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 16, color: mutedColor),
                  const SizedBox(width: 8),
                  Text(
                    portfolioData.contact.location,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12.5,
                      color: subtextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),

        // Social Buttons
        Text(
          'CONNECT ON SOCIALS',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: mutedColor,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            SocialButton(
              url: portfolioData.socialLinks.email,
              type: SocialType.email,
              tooltip: 'Email Raniya',
              backgroundColor: isDark ? const Color(0xFF18181B) : Colors.black,
              iconColor: Colors.white,
            ),
            const SizedBox(width: 14),
            SocialButton(
              url: portfolioData.socialLinks.github,
              type: SocialType.github,
              tooltip: 'GitHub Profile',
              backgroundColor: isDark ? const Color(0xFF18181B) : Colors.black,
              iconColor: Colors.white,
            ),
            const SizedBox(width: 14),
            SocialButton(
              url: portfolioData.socialLinks.linkedin,
              type: SocialType.linkedin,
              tooltip: 'LinkedIn Profile',
              backgroundColor: isDark ? const Color(0xFF18181B) : Colors.black,
              iconColor: Colors.white,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm(
    Color cardBgColor,
    Color borderColor,
    Color textColor,
    Color subtextColor,
    bool isDark,
  ) {
    if (_formSubmitted) {
      return Container(
        padding: const EdgeInsets.all(48),
        decoration: BoxDecoration(
          color: cardBgColor,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: const Color(0xFF10B981).withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF10B981).withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_outline_rounded,
                size: 48,
                color: Color(0xFF10B981),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Message Sent Successfully!',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Thank you for reaching out. I look forward to connecting with you soon.',
              textAlign: TextAlign.center,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: subtextColor,
                height: 1.5,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(36),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
            blurRadius: 28,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send a Message',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Fill in the details below and I’ll get back to you promptly.',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 13.5,
                color: subtextColor,
              ),
            ),
            const SizedBox(height: 28),

            // Name
            Text(
              'YOUR NAME',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
                color: subtextColor,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _nameController,
              validator: (val) => val == null || val.trim().isEmpty ? 'Please enter your name' : null,
              style: GoogleFonts.plusJakartaSans(color: textColor, fontSize: 14),
              decoration: _inputDecoration(
                hintText: 'e.g. Alex Morgan',
                textColor: textColor,
                borderColor: borderColor,
                isDark: isDark,
              ),
            ),
            const SizedBox(height: 20),

            // Email
            Text(
              'EMAIL ADDRESS',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
                color: subtextColor,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              validator: (val) {
                if (val == null || val.trim().isEmpty) return 'Please enter your email';
                if (!val.contains('@') || !val.contains('.')) return 'Please enter a valid email address';
                return null;
              },
              style: GoogleFonts.plusJakartaSans(color: textColor, fontSize: 14),
              decoration: _inputDecoration(
                hintText: 'e.g. alex@example.com',
                textColor: textColor,
                borderColor: borderColor,
                isDark: isDark,
              ),
            ),
            const SizedBox(height: 20),

            // Message
            Text(
              'PROJECT OR INQUIRY DETAILS',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.0,
                color: subtextColor,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _messageController,
              maxLines: 4,
              validator: (val) => val == null || val.trim().isEmpty ? 'Please enter your message' : null,
              style: GoogleFonts.plusJakartaSans(color: textColor, fontSize: 14),
              decoration: _inputDecoration(
                hintText: 'Tell me about your project, timeline, or design goals...',
                textColor: textColor,
                borderColor: borderColor,
                isDark: isDark,
              ),
            ),
            const SizedBox(height: 28),

            // Submit Button
            _GlassSubmitButton(
              onPressed: _submitForm,
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required Color textColor,
    required Color borderColor,
    required bool isDark,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.plusJakartaSans(
        color: textColor.withOpacity(0.35),
        fontSize: 14,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      filled: true,
      fillColor: isDark ? const Color(0xFF141416) : Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: isDark ? Colors.white : Colors.black, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }
}

class _GlassCopyEmailButton extends StatefulWidget {
  final bool isCopied;
  final VoidCallback onTap;
  final bool isDark;

  const _GlassCopyEmailButton({
    required this.isCopied,
    required this.onTap,
    required this.isDark,
  });

  @override
  State<_GlassCopyEmailButton> createState() => _GlassCopyEmailButtonState();
}

class _GlassCopyEmailButtonState extends State<_GlassCopyEmailButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor = widget.isCopied
        ? const Color(0xFF10B981)
        : (widget.isDark ? Colors.white : const Color(0xFF0F172A));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          transform: Matrix4.identity()..scale(_isHovered ? 1.05 : 1.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: (widget.isCopied ? const Color(0xFF10B981) : Colors.black).withValues(alpha: widget.isDark ? 0.35 : 0.12),
                  blurRadius: 14,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: widget.isDark
                      ? (_isHovered ? Colors.white.withValues(alpha: 0.16) : Colors.white.withValues(alpha: 0.08))
                      : (_isHovered ? Colors.black.withValues(alpha: 0.10) : Colors.black.withValues(alpha: 0.05)),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: widget.isDark
                        ? Colors.white.withValues(alpha: _isHovered ? 0.40 : 0.18)
                        : Colors.black.withValues(alpha: _isHovered ? 0.25 : 0.12),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.isCopied ? Icons.check_circle_rounded : Icons.copy_rounded,
                      color: textColor,
                      size: 15,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.isCopied ? 'COPIED' : 'COPY',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.8,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GlassSubmitButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isDark;

  const _GlassSubmitButton({
    required this.onPressed,
    required this.isDark,
  });

  @override
  State<_GlassSubmitButton> createState() => _GlassSubmitButtonState();
}

class _GlassSubmitButtonState extends State<_GlassSubmitButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: widget.isDark
                    ? Colors.white.withValues(alpha: _isHovered ? 0.25 : 0.08)
                    : Colors.black.withValues(alpha: _isHovered ? 0.22 : 0.10),
                blurRadius: _isHovered ? 24 : 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: widget.isDark
                        ? [
                            Colors.white.withValues(alpha: _isHovered ? 0.28 : 0.16),
                            Colors.white.withValues(alpha: _isHovered ? 0.16 : 0.08),
                          ]
                        : [
                            const Color(0xFF1E293B).withValues(alpha: _isHovered ? 0.95 : 0.88),
                            const Color(0xFF0F172A).withValues(alpha: _isHovered ? 0.98 : 0.92),
                          ],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: widget.isDark
                        ? Colors.white.withValues(alpha: _isHovered ? 0.50 : 0.25)
                        : Colors.white.withValues(alpha: _isHovered ? 0.35 : 0.18),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SEND MESSAGE',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w800,
                        fontSize: 12.5,
                        letterSpacing: 1.2,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

