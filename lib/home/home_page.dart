import 'package:flutter/material.dart';
import 'package:photo_editor/utils/text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;
  bool isExpanded=false;
  @override
  Widget build(BuildContext context) {
    size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
                  "images/editor.jpg",
              fit: BoxFit.cover,)
            ),
            AnimatedPositioned( duration: const Duration(milliseconds: 300),
              bottom: isExpanded?0:-(size.height/2)+100,
              child: Container(
                height: size.height/2,
                width: size.width,
                color: Colors.grey.withOpacity(.6),
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    ListTile(
                      title: Text(
                        "Filtering App",style: textWhite,
                      ),
                      trailing: IconButton(
                        onPressed: (){
                          setState((){
                            isExpanded=!isExpanded;
                          });
                        },
                        icon: Icon(!isExpanded?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,color: Colors.white,size: 30,),
                      ),
                    )
                  ],
                ),
              ),

            )
          ],
        ),
      )
    );
  }
}
