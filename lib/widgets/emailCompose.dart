import 'package:flutter/cupertino.dart';

class EmailComposeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Compose Email'),
      ),
      child: SafeArea(
        child: Padding(
          padding:const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoTextField(
                placeholder: 'From',
                padding:const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 8.0,),
              CupertinoTextField(
                placeholder: 'To',
                padding:const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              CupertinoTextField(
                placeholder: 'Subject',
                padding:const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16.0),
              CupertinoTextField(
                placeholder: 'Compose your email',
                maxLines: 10,
                padding:const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              const SizedBox(height: 16.0),
              CupertinoButton.filled(
                child:const Text('Send'),
                onPressed: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}