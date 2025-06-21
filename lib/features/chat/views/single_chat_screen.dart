import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
import 'package:viewing_nz/core/res/icons.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ChatController _chatController;
  final String _currentUserId = '82091008-a484-4a89-ae75-a22bf8d6f3ac';
  final String _otherUserId = '82091008-a484-4a89-ae75-a22bf8d6f3ad';

  // Sample users data
  final Map<String, User> _users = {
    '82091008-a484-4a89-ae75-a22bf8d6f3ac': User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
      name: 'Sahan Akash',
      avatar: null,
    ),
    '82091008-a484-4a89-ae75-a22bf8d6f3ad': User(
      id: '82091008-a484-4a89-ae75-a22bf8d6f3ad',
      name: 'James Carter',
      avatar: null,
    ),
  };

  @override
  void initState() {
    super.initState();
    _chatController = ChatController();
    _loadInitialMessages();
  }

  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  void _loadInitialMessages() {
    final messages = [
      Message(
        id: const Uuid().v4(),
        senderId: _currentUserId,
        content: 'Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        type: MessageType.text,
      ),
      Message(
        id: const Uuid().v4(),
        senderId: _otherUserId,
        content: 'Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.',
        timestamp: DateTime.now().subtract(
          const Duration(hours: 1, minutes: 30),
        ),
        type: MessageType.text,
        status: MessageStatus.seen,
      ),
      Message(
        id: const Uuid().v4(),
        senderId: _currentUserId,
        content: 'Lorem ipsum dolor sit amet consectetur. Erat nulla luctus.',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        type: MessageType.text,
      ),
      Message(
        id: const Uuid().v4(),
        senderId: _otherUserId,
        content:
            'Hello James Carter\nI\'m Sahan Akash. I would like to inquire about the price range of this property 32B Dart Place, Fernhill, Queenstown.\n\nLorem ipsum dolor sit amet consectetur. Risus aliquet sed rhoncus non in felis amet nisl eras. Fames amet natoque sapien eu ante cursus.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        type: MessageType.text,
        status: MessageStatus.seen,
      ),
    ];

    // Add messages to controller
    for (var message in messages) {
      _chatController.addMessage(message);
    }
  }

  Future<User?> _resolveUser(String userId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    return _users[userId];
  }

  void _onMessageSend(String content) {
    final message = Message(
      id: const Uuid().v4(),
      senderId: _currentUserId,
      content: content,
      timestamp: DateTime.now(),
      type: MessageType.text,
      status: MessageStatus.sent,
    );

    _chatController.addMessage(message);
  }

  void _onMessageTap(Message message, {TapUpDetails? details, int? index}) {
    if (message.type == MessageType.image && message.attachmentUrl != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FullScreenImageView(
            imageUrl: message.attachmentUrl!,
            heroTag: message.id,
          ),
        ),
      );
    }
  }

  void _onMessageLongPress(
    Message message, {
    LongPressStartDetails? details,
    int? index,
  }) {
    _showMessageOptions(message);
  }

  void _showMessageOptions(Message message) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const SvgIcon(SolarIcons.copy),
              title: const Text('Copy'),
              onTap: () {
                Navigator.pop(context);
                // Implement copy functionality
              },
            ),
            if (message.senderId == _currentUserId)
              ListTile(
                leading: const SvgIcon(
                  SolarIcons.trashBinMinimalistic2,
                  color: Colors.red,
                ),
                title: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _chatController.deleteMessage(message.id);
                },
              ),
            ListTile(
              leading: const SvgIcon(SolarIcons.reply),
              title: const Text('Reply'),
              onTap: () {
                Navigator.pop(context);
                // Implement reply functionality
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onAttachmentTap() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Send Attachment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAttachmentOption(
                  icon: SolarIcons.cameraAdd,
                  label: 'Photo',
                  color: Colors.blue,
                  onTap: _handleImageSelection,
                ),
                _buildAttachmentOption(
                  icon: SolarIcons.cloudPlus,
                  label: 'Document',
                  color: Colors.orange,
                  onTap: _handleFileSelection,
                ),
                _buildAttachmentOption(
                  icon: SolarIcons.mapPoint,
                  label: 'Location',
                  color: Colors.green,
                  onTap: _handleLocationShare,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentOption({
    required SvgIconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SvgIcon(icon, size: 28, color: color),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.w500, color: color),
            ),
          ],
        ),
      ),
    );
  }

  void _handleImageSelection() async {
    Navigator.pop(context);

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Image Source',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageSourceOption(
                  icon: SolarIcons.camera,
                  label: 'Camera',
                  onTap: () => _pickImage(ImageSource.camera),
                ),
                _buildImageSourceOption(
                  icon: SolarIcons.album,
                  label: 'Gallery',
                  onTap: () => _pickImage(ImageSource.gallery),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSourceOption({
    required SvgIconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SvgIcon(icon, size: 32, color: Colors.blue),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  void _pickImage(ImageSource source) async {
    Navigator.pop(context);

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );

    if (image != null) {
      final message = Message(
        id: const Uuid().v4(),
        senderId: _currentUserId,
        content: 'Image',
        timestamp: DateTime.now(),
        type: MessageType.image,
        attachmentUrl: image.path,
        status: MessageStatus.sent,
      );

      _chatController.addMessage(message);
    }
  }

  void _handleFileSelection() async {
    Navigator.pop(context);

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      final file = result.files.single;
      final message = Message(
        id: const Uuid().v4(),
        senderId: _currentUserId,
        content: file.name,
        timestamp: DateTime.now(),
        type: MessageType.file,
        attachmentUrl: file.path!,
        status: MessageStatus.sent,
      );

      _chatController.addMessage(message);
    }
  }

  void _handleLocationShare() {
    Navigator.pop(context);

    final message = Message(
      id: const Uuid().v4(),
      senderId: _currentUserId,
      content: 'Location: location',
      timestamp: DateTime.now(),
      type: MessageType.location,
      status: MessageStatus.sent,
    );

    _chatController.addMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const SvgIcon(SolarIcons.altArrowLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "James Carter",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "widget.contactPhone",
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgIcon(SolarIcons.callChat, color: Colors.green),
            onPressed: () {
              // Implement call functionality
            },
          ),
          IconButton(
            icon: const SvgIcon(SolarIcons.menuDots, color: Colors.black),
            onPressed: () {
              _showMoreOptions();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Chat(
              currentUserId: _currentUserId,
              resolveUser: _resolveUser,
              chatController: _chatController,
              theme: ChatTheme(
                backgroundColor: Colors.grey[50]!,
                primaryColor: Colors.blue,
                secondaryColor: Colors.grey[200]!,
                sentMessageColor: Colors.blue,
                receivedMessageColor: Colors.white,
                textColor: Colors.black,
                sentTextColor: Colors.white,
                timestampColor: Colors.grey,
              ),
              onMessageSend: _onMessageSend,
              onMessageTap: _onMessageTap,
              onMessageLongPress: _onMessageLongPress,
              onAttachmentTap: _onAttachmentTap,
              timeFormat: DateFormat('HH:mm'),
            ),
          ),
          _buildCustomInputField(),
        ],
      ),
    );
  }

  Widget _buildCustomInputField() {
    final TextEditingController textController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: _onAttachmentTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const SvgIcon(
                SolarIcons.addCircle,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: 'Type here',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onSubmitted: (text) {
                  if (text.trim().isNotEmpty) {
                    _onMessageSend(text.trim());
                    textController.clear();
                  }
                },
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                final text = textController.text.trim();
                if (text.isNotEmpty) {
                  _onMessageSend(text);
                  textController.clear();
                }
              },
              icon: const SvgIcon(
                SolarIcons.sendSquare,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMoreOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const SvgIcon(SolarIcons.clipboardRemove),
              title: const Text('Clear Chat'),
              onTap: () {
                Navigator.pop(context);
                _chatController.clearMessages();
              },
            ),
            ListTile(
              leading: const SvgIcon(
                SolarIcons.userBlockRounded,
                color: Colors.red,
              ),
              title: const Text(
                'Block Contact',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                // Implement block functionality
              },
            ),
            ListTile(
              leading: const SvgIcon(
                SolarIcons.notebook1,
                color: Colors.orange,
              ),
              title: const Text(
                'Report',
                style: TextStyle(color: Colors.orange),
              ),
              onTap: () {
                Navigator.pop(context);
                // Implement report functionality
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;
  final String heroTag;

  const FullScreenImageView({
    super.key,
    required this.imageUrl,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const SvgIcon(SolarIcons.closeCircle, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const SvgIcon(SolarIcons.share, color: Colors.white),
            onPressed: () {
              // Implement share
            },
          ),
          IconButton(
            icon: const SvgIcon(SolarIcons.download, color: Colors.white),
            onPressed: () {
              // Implement download
            },
          ),
        ],
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: PhotoView(
            imageProvider: FileImage(File(imageUrl)),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2.0,
            initialScale: PhotoViewComputedScale.contained,
            heroAttributes: PhotoViewHeroAttributes(tag: heroTag),
          ),
        ),
      ),
    );
  }
}

// Mock models and classes - replace with your actual implementations
class User {
  final String id;
  final String name;
  final String? avatar;

  User({required this.id, required this.name, this.avatar});
}

class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final MessageType type;
  final String? attachmentUrl;
  final MessageStatus status;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    required this.type,
    this.attachmentUrl,
    this.status = MessageStatus.sent,
  });
}

enum MessageType { text, image, file, location }

enum MessageStatus { sent, delivered, seen }

class ChatController {
  final List<Message> _messages = [];

  void addMessage(Message message) {
    _messages.insert(0, message);
    // Notify listeners
  }

  void deleteMessage(String messageId) {
    _messages.removeWhere((msg) => msg.id == messageId);
    // Notify listeners
  }

  void clearMessages() {
    _messages.clear();
    // Notify listeners
  }

  void dispose() {
    // Clean up resources
  }
}

class ChatTheme {
  final Color backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final Color sentMessageColor;
  final Color receivedMessageColor;
  final Color textColor;
  final Color sentTextColor;
  final Color timestampColor;

  ChatTheme({
    required this.backgroundColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.sentMessageColor,
    required this.receivedMessageColor,
    required this.textColor,
    required this.sentTextColor,
    required this.timestampColor,
  });
}

// Mock Chat widget - replace with your actual Chat widget
class Chat extends StatelessWidget {
  final String currentUserId;
  final Future<User?> Function(String) resolveUser;
  final ChatController chatController;
  final ChatTheme? theme;
  final void Function(String)? onMessageSend;
  final void Function(Message, {TapUpDetails? details, int? index})?
  onMessageTap;
  final void Function(Message, {LongPressStartDetails? details, int? index})?
  onMessageLongPress;
  final void Function()? onAttachmentTap;
  final DateFormat? timeFormat;

  const Chat({
    super.key,
    required this.currentUserId,
    required this.resolveUser,
    required this.chatController,
    this.theme,
    this.onMessageSend,
    this.onMessageTap,
    this.onMessageLongPress,
    this.onAttachmentTap,
    this.timeFormat,
  });

  @override
  Widget build(BuildContext context) {
    // This is a placeholder - implement your actual Chat widget here
    return Container(
      color: theme?.backgroundColor ?? Colors.grey[50],
      child: const Center(
        child: Text(
          'Chat Widget Implementation\nReplace with your actual Chat widget',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
