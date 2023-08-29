import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble_widget.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble_widget.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://media.licdn.com/dms/image/C4E03AQEc_VH9QOYyMw/profile-displayphoto-shrink_800_800/0/1658509721894?e=2147483647&v=beta&t=2GEA1fY3l0fq3ZZA40xIwLKneM3v38-Ur7xlcVmUoTE'),
            )),
        title: const Text('My love'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),

            //Text Box
            MessageFieldBox(
                onValue: (value) => chatProvider.sendMessege(value)),
          ],
        ),
      ),
    );
  }
}
