import 'package:flutter/material.dart';
import 'package:inbox_app/widgets/emailCompose.dart';
import 'package:inbox_app/model/inbox_model.dart';
import 'package:inbox_app/model/mail_model.dart';
import 'package:inbox_app/widget/appbar.dart';
import 'package:inbox_app/widget/easytext.dart';
import 'package:inbox_app/widget/emailComposeScreen.dart';
import 'package:inbox_app/widget/inboxStylish.dart';
import 'package:inbox_app/widget/paddingstylishbutton.dart';
import 'package:inbox_app/widget/stylishButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _value = [];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _value = List<bool>.filled(getMail.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _bottomsheet(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EmailComposeScreen()));
          },
          backgroundColor: Colors.indigoAccent[400],
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            child: Column(children: [
              buildAppBar(context),
              buildInbox(name: "Inbox"),
              buildPaddingStylishButton(),
              const SizedBox(
                height: 12,
              ),
              buildListData(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildListData(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            controller: _scrollController,
            itemCount: getMail.length,
            itemBuilder: (_, index) {
              return ListTile(
                leading: Checkbox(
                  activeColor: Colors.red,
                  onChanged: (val) {
                    setState(() {
                      _value[index] = val!;
                    });
                  },
                  value: _value[index],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      getMail[index].title,
                      style: TextStyle(
                          color: getMail[index].isTrue
                              ? Colors.lightBlueAccent[700]
                              : Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      getMail[index].message,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                subtitle: Text(getMail[index].des),
                trailing: Text(getMail[index].time),
              );
            }));
  }

  void _bottomsheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            color: Colors.black54,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: buildText(
                          name: "Filter",
                          size: 29,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 13),
                    buildText(
                        name: "Inbox Categories",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: inboxcate.map((data) {
                          return Expanded(
                            child: Container(
                                margin: const EdgeInsets.all(5),
                                // alignment: Alignment.center,
                                height: 140,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Stack(
                                  children: [
                                    Center(child: Text(data.name)),
                                    Positioned(
                                        bottom: 1,
                                        right: 9,
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: Icon(
                                            data.isColor
                                                ? Icons.check_circle
                                                : null,
                                            color: Colors.indigo[800],
                                          ),
                                        ))
                                  ],
                                )),
                          );
                        }).toList(),
                      ),
                    ),
                    buildText(
                        name: "Date",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildStylishButton(
                            name: "Last 30 days",
                            size: const Size(140, 50),
                            backgroundcolor: Colors.grey,
                            textcolor: Colors.black),
                        const SizedBox(
                          width: 12,
                        ),
                        buildStylishButton(
                            name: "Last 7 days",
                            size: const Size(140, 50),
                            backgroundcolor: Colors.grey,
                            textcolor: Colors.black),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildStylishButton(
                            name: "Apply Filter",
                            size: const Size(210, 50),
                            backgroundcolor: Colors.indigoAccent,
                            textcolor: Colors.white),
                        const SizedBox(
                          width: 12,
                        ),
                        buildStylishButton(
                            name: "Reset",
                            size: const Size(140, 50),
                            backgroundcolor: Colors.grey,
                            textcolor: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
