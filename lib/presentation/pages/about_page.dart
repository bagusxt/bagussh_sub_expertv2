import 'package:flutter/material.dart';
import 'package:sub_bagussh/common/constants.dart';

class 
  AboutPage 


extends 
  StatelessWidget 
{

static const
  ROUTE_NAME 
    = '/about';

 @override
   Widget 
      build
        (BuildContext
           context) 
{

return Scaffold(body: Stack(

children: [Column(
  children: [Expanded(
    child:Container(
      color: kPrussianBlue,
        child:Center(
          
        child: Image.asset('assets/circle-g.png',width: 128,
      ),
    ),
  ),
),



Expanded(child: Container(
    padding: const EdgeInsets.all(33.0),
      color: kMikadoYellow,
          child: Text('Ditonton, merupakan sebuah aplikasi katalog film yang dikembangkan oleh Dicoding Indonesia,sebagai contoh proyek aplikasi untuk kelas menjadi Flutter Developer Expert.',
      
          style: TextStyle
      (color: Color.fromARGB(222, 15, 1, 67), fontSize: 14),
    textAlign: TextAlign.justify,
      ),
    ),
  ), ],
),


SafeArea(child: 
  IconButton(onPressed: () => Navigator.pop(context),
    icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      )],
    ),
  );}
}