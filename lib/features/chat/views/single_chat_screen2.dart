// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_chat_core/flutter_chat_core.dart';
// import 'package:flutter_chat_ui/flutter_chat_ui.dart';
// import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
// import 'package:uuid/uuid.dart';
// import 'package:viewing_nz/core/extensions/theme_extension.dart';

// class SingleChatScreen2 extends StatefulWidget {
//   const SingleChatScreen2({super.key});

//   @override
//   State<SingleChatScreen2> createState() => _SingleChatScreen2State();
// }

// class _SingleChatScreen2State extends State<SingleChatScreen2> {
//   final InMemoryChatController _chatController = InMemoryChatController();
//   final types.User _currentUser = const types.User(id: 'user-1');

//   void _loadInitialMessages() {
//     final messages = [
//       types.TextMessage(
//         id: const Uuid().v4(),
//         senderId: _currentUser,
//         content: 'Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.',
//         timestamp: DateTime.now().subtract(const Duration(hours: 2)),
//       ),
//       TextMessage(
//         id: const Uuid().v4(),
//         senderId: _otherUserId,
//         content: 'Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.',
//         timestamp: DateTime.now().subtract(
//           const Duration(hours: 1, minutes: 30),
//         ),
//         type: MessageType.text,
//         status: MessageStatus.seen,
//       ),
//       TextMessage(
//         id: const Uuid().v4(),
//         senderId: _currentUserId,
//         content: 'Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.',
//         timestamp: DateTime.now().subtract(const Duration(hours: 1)),
//         type: MessageType.text,
//       ),
//       TextMessage(
//         id: const Uuid().v4(),
//         senderId: _otherUserId,
//         content:
//             'Hello James Carter\nI\'m Sahan Akash. I would like to inquire about the price range of this property 32B Dart Place, Fernhill, Queenstown.\n\nLorem ipsum dolor sit amet consectetur. Risus aliquet sed rhoncus non in felis amet nisl eras. Fames amet natoque sapien eu ante cursus.',
//         timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
//         type: MessageType.text,
//         status: MessageStatus.seen,
//       ),
//     ];

//     // Add messages to controller
//     for (var message in messages) {
//       _chatController.addMessage(message);
//     }
//   }

//   @override
//   void dispose() {
//     _chatController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: Chat(
//           theme: ChatTheme(
//             colors: ChatColors(
//               primary: context.primary,
//               onPrimary: context.onPrimary,
//               surface: context.surface,
//               onSurface: context.onSurface,
//               surfaceContainer: context.colorScheme.surfaceContainer,
//               surfaceContainerLow: context.colorScheme.surfaceContainerLow,
//               surfaceContainerHigh: context.colorScheme.surfaceContainerHigh,
//             ),
//             typography: ChatTypography(
//               bodyLarge: context.bodyLarge,
//               bodyMedium: context.bodyMedium,
//               bodySmall: context.bodySmall,
//               labelLarge: context.labelLarge,
//               labelMedium: context.labelMedium,
//               labelSmall: context.labelSmall,
//             ),
//             shape: BorderRadiusGeometry.circular(12),
//           ),
//           chatController: _chatController,
//           currentUserId: 'user1',
//           onMessageSend: (text) {
//             _chatController.insertMessage(
//               TextMessage(
//                 id: '${Random().nextInt(1000) + 1}',
//                 authorId: 'user1',
//                 createdAt: DateTime.now().toUtc(),
//                 text: text,
//               ),
//             );
//           },
//           resolveUser: (UserID id) async {
//             return User(id: id, name: 'John Doe');
//           },
//         ),
//       ),
//     );
//   }
// }
