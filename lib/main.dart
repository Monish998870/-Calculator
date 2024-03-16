import 'package:flutter/material.dart';
void main(){
  runApp( const CalculatorApp());
}
class CalculatorApp extends StatefulWidget{
   const CalculatorApp({super.key});
  @override
  Calculator createState() => Calculator();
}
class Calculator extends State{
String exp="",history="";
String res="",op="";
dynamic a=0,b=0;
  void callback(String g){
    if(g=="C"){
      exp="";
      history="";
      res="";
      a=0;
      b=0;
    }
    else if(g=='+'||g=='-'||g=='*'||g=='/'||g=="%"){
      if(exp.contains('.'))
      a=double.parse(exp);
      else
        a=int.parse(exp);
      res="";
      op=g;
    }
    else if(op=='%'&& g=='=') {
      res = (a / 100).toString();
      history=a.toString()+op;
    }
    else if(g=='<'){
      res=exp.substring(0,exp.length-1);
    }
    else if(g=='+/-'){
      if(exp[0]!='-')
        res='-'+exp;
      else
        res=exp.substring(1);
    }
    else if(g=='='){
      if(exp.contains('.'))
      b=double.parse(exp);
      else
        b=int.parse(exp);
      if(op=='+'){
        res=(a+b).toString();
        history=a.toString()+op+b.toString();
      }
      if(op=='-'){
        res=(a-b).toString();
        history=a.toString()+op+b.toString();
      }
      if(op=='*'){
        res=(a*b).toString();
        history=a.toString()+'x'+b.toString();
      }if(op=='/'){
        if(a%b==0)
        res=(a/b).toInt().toString();
        else
    res=(a/b).toString();
        history=a.toString()+op+b.toString();
      }
    }
    else{
      res=(exp+g);
    }
setState(() {
  exp=res;
});
  }
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
        home:Scaffold(
            appBar: AppBar(centerTitle:true , backgroundColor:Colors.indigoAccent ,title: Text("CALCULATOR",style:TextStyle(fontSize:30,fontWeight:FontWeight.w900),)),
            backgroundColor: Colors.black,
            body:Center(
             child:Column(
              mainAxisAlignment:MainAxisAlignment.end,
              children:[
                Container(
                child: Padding(
                  padding:EdgeInsets.all(10.0),
                  child:Text(history,style: TextStyle(color:Colors.white70,fontSize:36,fontWeight:FontWeight.w600),)
                  ),
                alignment:Alignment(1.0,1.0),
              ),
                Container(
                  child: Padding(
                      padding:EdgeInsets.all(10.0),
                      child:Text(exp,style: TextStyle(color: Colors.white,fontSize:50,fontWeight:FontWeight.w600,fontFamily: 'pacifico'),)
                  ),
                  alignment: Alignment(1.0,1.0),
                ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Container(
                      margin:EdgeInsets.all(10.0),
                      child: SizedBox(
                        width:70,
                        height:70,
                        child: TextButton(
                            onPressed: (){callback("C");},
                            child:Text("C",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                            style:TextButton.styleFrom(backgroundColor:Colors.amber[700],foregroundColor:Colors.white)
                        )
                        )
                      ),
                  Container(
                    margin:EdgeInsets.all(10.0),
                    child: SizedBox(
                        width:70,
                        height:70,
                        child: TextButton(
                            onPressed: (){callback("+/-");},
                            child:Text("+/-",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                            style:TextButton.styleFrom(backgroundColor:Colors.pinkAccent,foregroundColor:Colors.white)
                        )
                    ) ,
                  ),
                  Container(
                    margin:EdgeInsets.all(10.0),
                    child: SizedBox(
                        width:70,
                        height:70,
                        child: TextButton(
                            onPressed: (){callback("%");},
                            child:Text("%",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                            style:TextButton.styleFrom(backgroundColor:Colors.pinkAccent,foregroundColor:Colors.white)
                        )
                    ) ,
                  ),
                  Container(
                    margin:EdgeInsets.all(10.0),
                    child: SizedBox(
                        width:70,
                        height:70,
                        child: TextButton(
                            onPressed: (){callback("/");},
                            child:Text("/",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                            style:TextButton.styleFrom(backgroundColor:Colors.pinkAccent,foregroundColor:Colors.white)
                        )
                    ) ,
                  ),
            ]
            ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("7");},
                                child:Text("7",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("8");},
                                child:Text("8",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("9");},
                                child:Text("9",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("*");},
                                child:Text("x",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.pinkAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("4");},
                                child:Text("4",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("5");},
                                child:Text("5",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: ()=>callback("6"),
                                child:Text("6",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("-");},
                                child:Text("-",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.pinkAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("1");},
                                child:Text("1",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("2");},
                                child:Text("2",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("3");},
                                child:Text("3",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("+");},
                                child:Text("+",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.pinkAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                    ]
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("<");},
                                child:Text("<",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.amber[700],foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("0");},
                                child:Text("0",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback(".");},
                                child:Text(".",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.indigoAccent,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                      Container(
                        margin:EdgeInsets.all(10.0),
                        child: SizedBox(
                            width:70,
                            height:70,
                            child: TextButton(
                                onPressed: (){callback("=");},
                                child:Text("=",style: TextStyle(fontSize:30,fontWeight:FontWeight.w600,fontFamily:'Pacifico'  )),
                                style:TextButton.styleFrom(backgroundColor:Colors.green,foregroundColor:Colors.white)
                            )
                        ) ,
                      ),
                    ]
                )
  ]
    )
            )
    )
    );
  }
}