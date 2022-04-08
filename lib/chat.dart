import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  Chat({Key key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({this.messageContent,this.messageType});
}

class required {
}

class _ChatState extends State<Chat> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Buenas tardes", messageType: "sender"),
    ChatMessage(
        messageContent: "Que tal, ¿En qué podemos servirte?",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "¿Tienes mesas disponibles para mañana a las 8 pm?",
        messageType: "sender"),
    ChatMessage(messageContent: "Sí, por su puesto.", messageType: "receiver"),
    ChatMessage(
        messageContent: "¿Está interesad@ en reservar?",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "No gracias, solo ando viendo", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurante'),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: (messages[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType == "receiver"
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      messages[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
