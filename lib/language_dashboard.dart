import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomePage extends StatelessWidget {
  final List locale =[
    {'name':'ENGLISH','locale': Locale('en','US')},
    {'name':'TAMIL','locale': Locale('tn','IN')},
    {'name':'MALAYALAM','locale': Locale('ml','IN')},
    {'name':'ಕನ್ನಡ','locale': Locale('kn','IN')},
    {'name':'हिंदी','locale': Locale('hi','IN')},
  ];
  updateLanguage(Locale locale){
    Get.back();
    Get.updateLocale(locale);
  }
  buildLanguageDialog(BuildContext context){
    showDialog(context: context,
        builder: (builder){
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue
              ),

              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(child: Container(
                        height: 50,
                          decoration:  BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withAlpha(50),
                offset: const Offset(1.0, 1.0),
                blurRadius: 2,
                spreadRadius: 2)
          ],
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(20.0),
        ),
                          child: Center(child: Text(locale[index]['name']))),onTap: (){
                        print(locale[index]['name']);
                        updateLanguage(locale[index]['locale']);
                      },),
                    );
                  }, separatorBuilder: (context,index){
                return SizedBox();
              }, itemCount: locale.length
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage("assets/images/backgroundimage.jpg"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text('hello'.tr,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Center(child: Text('message'.tr,style: TextStyle(fontSize: 15,color: Colors.white),textAlign: TextAlign.center,)),
              SizedBox(height: 20,),



              InkWell(
                onTap: (){
                  buildLanguageDialog(context);
                },
                child: Container(
                  height: 40,width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.white,
                        Colors.blue
                      ]
                    )
                  ),
                  child: Center(child: Text('changelang'.tr,style: TextStyle(color: Colors.black),textAlign: TextAlign.center,)),
                ),
              )
             /* ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, foregroundColor: Colors.indigo),
                  onPressed: (){
                buildLanguageDialog(context);
              }, child: Text('changelang'.tr)),*/
            ],
          ),
        )
    );
  }
}