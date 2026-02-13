import 'package:get/get.dart';
import 'package:go_workout/generated/assets.dart';
import 'package:go_workout/view/screens/launch/get_started.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;
  List<dynamic> onboarding = [
    {
      'title': 'WELCOME TO GO',
      'subtitle': 'WORKOUT',
      'subtxt':
          'Connect with top basketball coaches around you for private training sessions.',
      'path': Assets.imagesOnboarding,
    },
    {
      'title': 'FOR PLAYERS &',
      'subtitle': 'COACHES',
      'subtxt':
          'Whether you’re a player looking to improve or a coach ready to train, we’ve got you covered.',
      'path': Assets.imagesOnboard2,
    },
    {
      'title': 'SEAMLESS BOOKINGS &',
      'subtitle': 'PAYMENTS',
      'subtxt':
          'Browse profiles, manage sessions with ease, and handle all payments securely within the app.',
      'path': Assets.imagesOnboard3,
    },
  ];
  void nextPage() {
    if (currentIndex.value < onboarding.length - 1) {
      currentIndex.value++;
    } else {
      // Handle final action
      Get.to(() => GetStarted());
    }
  }
}
