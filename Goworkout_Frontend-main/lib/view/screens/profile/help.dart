import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_workout/constants/app_colors.dart';
import 'package:go_workout/constants/app_styling.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/widgets/Icon_title_subtitle.dart';
import 'package:go_workout/view/widgets/common_image_view_widget.dart';
import 'package:go_workout/view/widgets/custom_animated_row.dart';
import 'package:go_workout/view/widgets/my_text_widget.dart';
import 'package:go_workout/view/widgets/simple_app_bar.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  static const List<Map<String, String>> _faqs = [
    {
      'q': 'How do I book a session with a coach?',
      'a':
          "Open the Discover tab, pick a coach, then tap 'Book Coach'. Choose a date and time slot in the coach's availability calendar, confirm the address, and pay. The coach will receive your request and confirm it within a few hours.",
    },
    {
      'q': 'How do coaches get paid?',
      'a':
          "Coaches receive payment in their in-app wallet once you validate that the session was completed. They can then withdraw funds to their bank account at any time from the wallet page.",
    },
    {
      'q': 'Can I cancel or reschedule a session?',
      'a':
          "Yes. From My Bookings, open the session and tap 'Cancel Booking' or 'Reschedule'. Cancellations made more than 24 hours before the session are fully refundable. Within 24 hours, a 30% fee applies.",
    },
    {
      'q': 'What payment methods are supported?',
      'a':
          "We support Visa, Mastercard, American Express, Google Pay and Apple Pay. All payments are processed securely. We never store your full card number on our servers.",
    },
    {
      'q': 'Is the chat with the coach private?',
      'a':
          "Yes. Messages between you and the coach are private and visible only to both of you. Our moderation team can review messages only when a report is filed.",
    },
    {
      'q': 'How are coaches verified?',
      'a':
          "Each coach must provide ID, proof of basketball coaching experience and a recent photo. Verified coaches show a checkmark next to their name.",
    },
    {
      'q': 'I forgot my password — what do I do?',
      'a':
          "On the login screen, tap 'Forget Password'. We'll email you a code to reset it. If the email doesn't arrive within a few minutes, check your spam folder.",
    },
    {
      'q': 'How do I report a coach or a player?',
      'a':
          "Open the profile, tap the three-dot menu in the top right, then 'Report'. Tell us what happened and our team will review within 48 hours.",
    },
    {
      'q': 'How do I delete my account?',
      'a':
          "Profile → Delete Account. Your data is removed within 30 days. Pending bookings and unpaid sessions must be settled before deletion.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: 'Help', centerTitle: T),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: kPrimary100,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: AnimatedRow(
              spacing: 20,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      MyText(
                        text: 'Need help with your bookings?',
                        weight: wmedium,
                        size: 15,
                        color: kGrey2Color,
                        paddingBottom: 12,
                      ),
                      MyText(
                        text:
                            'Chat with our support team. We answer within a few hours.',
                        size: 12,
                        color: kGrey5Color,
                      ),
                    ],
                  ),
                ),
                CommonImageView(imagePath: Assets.imagesHelp2, height: 80),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: _ContactTile(
                  icon: Icons.mail_outline,
                  title: 'Email us',
                  subtitle: 'support@goworkout.app',
                  onTap: () {
                    Get.snackbar(
                      'Support',
                      'Opening your email client...',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: kPrimary100,
                      colorText: kQuaternaryColor,
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ContactTile(
                  icon: Icons.chat_bubble_outline,
                  title: 'Live chat',
                  subtitle: 'Mon–Fri 9–18',
                  onTap: () {
                    Get.snackbar(
                      'Support',
                      'A support agent will be with you shortly.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: kPrimary100,
                      colorText: kQuaternaryColor,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          MyText(
            text: 'Frequently Asked Questions',
            size: 16,
            weight: wsemibold,
            paddingBottom: 12,
          ),
          for (final faq in _faqs)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: ktransparent,
                  splashColor: ktransparent,
                  highlightColor: ktransparent,
                ),
                child: Container(
                  decoration: roundedr(kPrimary100, 16),
                  child: ExpansionTile(
                    iconColor: kQuaternaryColor,
                    collapsedIconColor: kQuaternaryColor,
                    tilePadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    title: MyText(
                      text: faq['q']!,
                      size: 14,
                      weight: wmedium,
                      color: kQuaternaryColor,
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: faq['a']!,
                          size: 13,
                          color: kGrey5Color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          const SizedBox(height: 24),
          MyText(
            text: 'Other resources',
            size: 16,
            weight: wsemibold,
            paddingBottom: 12,
          ),
          IconTitleSubtitle(
            decoration: roundedr(kPrimary100, 16),
            title: 'Terms & Conditions',
            hasicon: false,
            trailing: CommonImageView(
              imagePath: Assets.imagesRight2,
              height: 20,
            ),
            padEnds: 16,
            padVertical: 16,
          ),
          const SizedBox(height: 10),
          IconTitleSubtitle(
            decoration: roundedr(kPrimary100, 16),
            title: 'Privacy Policy',
            hasicon: false,
            trailing: CommonImageView(
              imagePath: Assets.imagesRight2,
              height: 20,
            ),
            padEnds: 16,
            padVertical: 16,
          ),
          const SizedBox(height: 10),
          IconTitleSubtitle(
            decoration: roundedr(kPrimary100, 16),
            title: 'Community Guidelines',
            hasicon: false,
            trailing: CommonImageView(
              imagePath: Assets.imagesRight2,
              height: 20,
            ),
            padEnds: 16,
            padVertical: 16,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  const _ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: roundedr(kPrimary100, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: kSecondaryColor, size: 28),
            const SizedBox(height: 12),
            MyText(text: title, weight: wsemibold, size: 14),
            const SizedBox(height: 4),
            MyText(text: subtitle, size: 12, color: kGrey5Color),
          ],
        ),
      ),
    );
  }
}
