import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'models/chatMessage.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';

class chat extends StatefulWidget {
  const chat({Key? key}) : super(key: key);

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {
  late File photoFile;
  List<chatMessage> messages = [
    chatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    chatMessage(messageContent: "How have you been?", messageType: "receiver"),
    chatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    chatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    chatMessage(messageContent: "How have you been?", messageType: "receiver"),
    chatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    chatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    chatMessage(messageContent: "How have you been?", messageType: "receiver"),
    chatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    chatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    chatMessage(messageContent: "How have you been?", messageType: "receiver"),
    chatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    chatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    chatMessage(messageContent: "How have you been?", messageType: "receiver"),
    chatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    chatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
    chatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    chatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
  ];
  final TextEditingController _controller = TextEditingController();
  late String messageText;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bavkground4.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 206, 190, 168),
            toolbarHeight: 70,
            title: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(
                      'https://demo.sparklewpthemes.com/online-estore-pro/women-fashion/wp-content/uploads/sites/2/2016/12/young-attractive-woman.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text('Marija Krsanin',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors
                              .white) /*TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.white), */
                      ),
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 55),
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: messages.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        clipper: messages[index].messageType == "receiver"
                            ? ChatBubbleClipper2(type: BubbleType.sendBubble)
                            : ChatBubbleClipper2(
                                type: BubbleType.receiverBubble),
                        alignment: messages[index].messageType == "receiver"
                            ? Alignment.topRight
                            : Alignment.topLeft,
                        margin: EdgeInsets.only(top: 10),
                        backGroundColor:
                            messages[index].messageType == "receiver"
                                ? Colors.blue[100]
                                : Colors.white,
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                          ),
                          child: Text(
                            messages[index].messageContent,
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      );
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                    minLines: 1,
                    decoration: InputDecoration(
                      suffixIcon: _controller.text.isEmpty
                          ? IconButton(
                              onPressed: () {
                                _getFromGallery();
                              },
                              icon: Icon(
                                Icons.photo,
                                color: Colors.black45,
                                size: 27,
                              ),
                            )
                          : IconButton(
                              icon: const Icon(
                                Icons.send,
                              ),
                              onPressed: () {
                                setState(() {});
                              }),

                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.all(15),
                      // border: InputBorder.none,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),

                      hintText: 'Poruka...',
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        photoFile = File(pickedFile.path);
      });
    }
  }
}
