// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import 'package:magicalia/chat/bloc/chat_bloc.dart';
import 'package:magicalia/models/chat_message_model.dart';
import 'package:magicalia/screens/ChooseOption_screen.dart';
import 'package:get/get.dart' as Get; // Add 'as Get' alias here

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatBloc chatBloc = ChatBloc();
  TextEditingController textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ChatBloc, ChatState>(
        bloc: chatBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case ChatSuccessState:
              List<ChatMessageModel> messages =
                  (state as ChatSuccessState).messages;
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 500), // Adjust duration
                  curve: Curves.easeInOut, // Adjust curve
                );
              });
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.5,
                    image: AssetImage("assets/bg1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChooseOptionScreen()),
                            );
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                        Text(
                          'Chat with AI ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            fontFamily: 'Anta',
                          ),
                        ),
                        SizedBox(width: 50), // Adjust spacing
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: () {
                              Clipboard.setData(ClipboardData(
                                  text: messages[index].parts.first.text));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Copied to clipboard')),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 12),
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 8, bottom: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blueGrey.withOpacity(0.3),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  (messages[index].role == "user"
                                      ? Container(
                                          height: 38,
                                          width: 38,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  AssetImage("assets/user.jpg"),
                                            ),
                                          ),
                                        )
                                      : Container(
                                          height: 38,
                                          width: 38,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/iconrobot2.png"),
                                            ),
                                          ),
                                        )),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      messages[index].parts.first.text,
                                      style: TextStyle(
                                        fontFamily: 'Anta',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  if (messages[index].role != "user")
                                    IconButton(
                                      icon: Icon(Icons.copy),
                                      onPressed: () {
                                        Clipboard.setData(ClipboardData(
                                            text: messages[index]
                                                .parts
                                                .first
                                                .text));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text('Copied to clipboard')),
                                        );
                                      },
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (chatBloc.generation)
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            child: Lottie.asset('assets/loader1.json'),
                          ),
                          SizedBox(width: 20),
                          Text(
                            'Loading...',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Theme.of(context).primaryColor,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: 'Ask Something from IA...',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade400),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () {
                              if (textEditingController.text.isNotEmpty) {
                                String text = textEditingController.text;
                                textEditingController.clear();
                                chatBloc.add(
                                  ChatGenerateNewTextMessageEvent(
                                    inputMessage: text,
                                  ),
                                );
                              }
                            },
                            child: CircleAvatar(
                              radius: 34,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Center(
                                  child: Icon(Icons.send),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );

            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
