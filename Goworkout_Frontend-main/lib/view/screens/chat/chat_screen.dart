// import 'package:bounce/bounce.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:get/get.dart';
// import 'package:go_workout/constants/app_colors.dart';
// import 'package:go_workout/constants/app_sizes.dart';
// import 'package:go_workout/generated/assets.dart';
// import 'package:go_workout/main.dart';
// import 'package:go_workout/view/widgets/chat_bubble_widget.dart';
// import 'package:go_workout/view/widgets/common_image_view_widget.dart';
// import 'package:go_workout/view/widgets/custom_dialog.dart';
// import 'package:go_workout/view/widgets/my_text_field.dart';
// import 'package:go_workout/view/widgets/my_text_widget.dart';

// // ignore: must_be_immutable
// class ChatScreen extends StatefulWidget {
//   final bool? haveInvoiceButton;
//   String? clienttype;
//   ChatScreen({super.key, this.haveInvoiceButton = false, this.clienttype});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kPrimary100,
//         elevation: 0,
//         toolbarHeight: 90,
//         automaticallyImplyLeading: false,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             GestureDetector(
//               onTap: () => Get.back(),
//               child: Image.asset(Assets.imagesBack, height: 22),
//             ),
//             SizedBox(width: 15),
//             InkWell(
//               onTap: () {},
//               child: Row(
//                 children: [
//                   Stack(
//                     children: [
//                       CommonImageView(
//                         height: 45,
//                         width: 45,
//                         url: dummyImage2,
//                         radius: 100.0,
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: CommonImageView(
//                           imagePath: Assets.imagesActive,
//                           height: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(width: 10),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       MyText(
//                         text: 'Melisa Thomas',
//                         size: 15,
//                         weight: FontWeight.w500,
//                       ),
//                       MyText(text: 'Active now', size: 12, color: kGrey5Color),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           Bounce(
//             onTap: () {
//               Get.dialog(
//                 CustomDialog(
//                   height: 0,
//                   title: 'Are you sure?',
//                   btncolor: ktransparent,
//                   outline1color: kQuaternaryColor,
//                   btntext: 'Cancel',
//                   btntext2: 'Delete',

//                   subtitle: 'You want to delete this chat?',
//                 ),
//               );
//             },
//             child: CommonImageView(imagePath: Assets.imagesTrash, height: 30),
//           ),
//           SizedBox(width: 20),
//           // Image.asset(
//           //   Assets.imagesMenu,
//           //   height: 19,
//           // ),
//           // SizedBox(
//           //   width: 20,
//           // )
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [

//           Divider(color: kPrimary100),
//           SizedBox(height: 10),
//           Padding(
//             padding: AppSizes.HORIZONTAL,
//             child: Row(
//               spacing: 10,
//               children: [
//                 CommonImageView(imagePath: Assets.imagesAttach, height: 24),
//                 Expanded(
//                   child: MyTextField(
//                     marginBottom: 0,
//                     bordercolor: kPrimary100,

//                     filledColor: kPrimary100,
//                     hint: 'Write your message',
//                     radius: 10,

//                     suffixIcon: CommonImageView(
//                       imagePath: Assets.imagesCopy,

//                       height: 24,
//                     ),
//                   ),
//                 ),
//                 CommonImageView(imagePath: Assets.imagesCam, height: 24),
//                 CommonImageView(imagePath: Assets.imagesMin, height: 24),
//               ],
//             ),
//           ),
//           SizedBox(height: 30),
//           // SendField(),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_workout/main.dart' show dummyImage, dummyImage2, dummyImage3;

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> chat = [
      {
        'isMe': true,
        'msg': 'Hi! May I know about your item Details?',
        'otherUserName': 'Marley Calzoni',
        'otherUserImg': dummyImage,
        'msgTime': '3:53',
        'haveTaskBubble': false,
        'taskDetail': {},
      },
      {
        'isMe': false,
        'msg':
            'Sure, man! You can check it from the description section of the Item.',
        'otherUserName': 'Marley Calzoni',
        'otherUserImg': dummyImage3,
        'msgTime': '3:53',
        'haveTaskBubble': false,
        'taskDetail': {},
      },
      {
        'isMe': true,
        'msg': 'I see, thanks for informing!',
        'otherUserName': 'Duseca software',
        'otherUserImg': dummyImage2,
        'msgTime': '3:53',
        'haveTaskBubble': true,
        'taskDetail': {},
      },
      {
        'isMe': false,
        'msg': 'Thanks for contacting me!',
        'otherUserName': 'Duseca software',
        'otherUserImg':
            'https://images.unsplash.com/photo-1733748330558-0d56cdd25dce?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxNHx8fGVufDB8fHx8fA%3D%3D',
        'msgTime': '3:53',
        'haveTaskBubble': true,
        'taskDetail': {},
      },
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/150?img=3',
          ), // Replace with actual user photo
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Edward Janowski', style: TextStyle(color: Colors.white)),
            Text(
              'Active now',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.delete, color: Colors.red),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text('Today', style: TextStyle(color: Colors.grey)),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: chat.length,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(15, 60, 15, 100),
              itemBuilder: (context, index) {
                var data = chat[index];
                return Animate(
                  effects: [
                    // MoveEffect(
                    //   duration: Duration(milliseconds: 300 + (index * 200)),
                    // ),
                  ],
                  child: Align(
                    alignment:
                        data['isMe'] == true
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                    child: ChatBubble(
                      message: data['msg'],
                      time: "09:25 AM",
                      isSender: data['isMe'],
                      avatarUrl: dummyImage,
                    ),
                  ),
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView(
          //     padding: const EdgeInsets.all(16),
          //     children: const [
          //       Align(
          //         alignment: Alignment.centerRight,
          //         child: ChatBubble(
          //           message: "Hello! Edward janow?",
          //           time: "09:25 AM",
          //           isSender: true,
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.centerLeft,
          //         child: ChatBubble(
          //           message: "Hello ! Nazrul How are you?",
          //           time: "09:25 AM",
          //           isSender: false,
          //           avatarUrl: 'https://i.pravatar.cc/150?img=3',
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.centerRight,
          //         child: ChatBubble(
          //           message: "You did your job well!",
          //           time: "09:25 AM",
          //           isSender: true,
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.centerLeft,
          //         child: ChatBubble(
          //           message: "Have a great working week!!",
          //           time: "09:25 AM",
          //           isSender: false,
          //           avatarUrl: 'https://i.pravatar.cc/150?img=3',
          //         ),
          //       ),
          //       Align(
          //         alignment: Alignment.centerLeft,
          //         child: ChatBubble(
          //           message: "Hope you like it",
          //           time: "09:25 AM",
          //           isSender: false,
          //           avatarUrl: 'https://i.pravatar.cc/150?img=3',
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isSender;
  final String? avatarUrl;

  const ChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isSender,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    final bubbleColor = isSender ? Colors.grey[850] : Colors.grey[900];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isSender && avatarUrl != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(avatarUrl!),
            ),
          ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment:
                  isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Text(message, style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.black,
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Write your message",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.attach_file, color: Colors.white),
          const SizedBox(width: 10),
          Icon(Icons.camera_alt, color: Colors.white),
        ],
      ),
    );
  }
}
