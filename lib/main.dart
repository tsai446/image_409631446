import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const ImageSh(title: '409631446蔡廷威'),
    );
  }
}

class ImageSh extends StatefulWidget {
  const ImageSh({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ImageSh> createState() => _ImageShState();
}

class _ImageShState extends State<ImageSh> {
  var images=['assets/images/logo.jpg','assets/images/aaa.jpg','assets/images/ckk_20211201_2210.jpg','assets/images/ccc.jpg'];
  int imageindex=1;
  String defult_image="assets/images/logo.jpg";

  void previous (){
    if(imageindex<=0){imageindex=4;}
    defult_image = images[imageindex-1];
    imageindex--;
  }
  void next (){
    if(imageindex>=3){imageindex=-1;}
    defult_image = images[imageindex+1];
    imageindex++;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text(widget.title),
    ),
     body: Center(
       child:  Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           GestureDetector(
             onTap: (){
               const snackBar =SnackBar(
                   content: Text('這是總冠軍',
                     textScaleFactor: 1.2,
                   ),
               );
               ScaffoldMessenger.of(context).showSnackBar(snackBar);
             },
             child: Container(
               height: 400,
               width: 400,
               child: Image.asset(defult_image),
             ),
           ),
           SizedBox(
             height: 40,
           ),
           Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(
                   onPressed:  (){
                     setState(() {
                       previous();
                     });
                   },
                  child: Text("上一頁",
                 textScaleFactor: 1.5,)
                 ),
                   SizedBox(width: 100,),
                   ElevatedButton(
                    onPressed : (){
                     setState(() {
                       next();
                     });
                     },
                     child:Text("下一頁",
                       textScaleFactor: 1.5,
                     ) ,
                   ),
               ],
             ),
           )
         ],
       )
     )
    );
  }
}

