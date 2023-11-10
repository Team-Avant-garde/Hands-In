import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handsin/Constants/apiConstants.dart';
import 'package:handsin/Constants/constants.dart';
import 'package:handsin/Services/apiService.dart';
import 'package:handsin/Services/getServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  final title = TextEditingController();
  final body = TextEditingController();
  final tag = TextEditingController();


  // Error Text handler
  String errorProvided = "";

  // Has Concern
  String hasConcern = "";
  bool hasConcernBool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: black
        ),
        backgroundColor: white,
      elevation: 0,
        title: Text('Create Post', style: TextStyle(
          color: black,
          fontSize: 17
        ),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.vertical,
            children: [
                Column(
                children: [
                  SizedBox(
                height: 40,
                child: 
                TextField(
                          controller: title,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0) ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: 'Title',
                            hintStyle: TextStyle(
                              color: black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)
                            )
                          ),
                        ),
               ),
               SizedBox(height: 20,),
                ConstrainedBox(
          //  fit: FlexFit.loose,
          constraints:  BoxConstraints(
            maxHeight: 150,
            // minHeight: 200,//when it reach the max it will use scroll
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child:  TextField(
            controller: body,
            maxLength: 400,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            minLines: 1,
           decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(5.0) ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            hintText: 'Problem',
                            hintStyle: TextStyle(
                              color: black
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)
                            ),
                          ),
          ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: tag,
                    cursorColor: black,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: '#tag',
                      fillColor: light_grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                hasConcernBool ? Text(hasConcern, style: TextStyle(color: black),) : SizedBox(width: 0,)
                ]
               ),
              //  Submit button
        
              GestureDetector(
                onTap: (){
                  // checkPostFormInputs();
                  createPost();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  alignment: Alignment.center,
                  child: Text('Post Problem',
                  style: TextStyle(
                    color: white
                  ),
                  ),
                ),
              )
            ],
          ),
        )
        ),
    );
  }

  Future <void> createPost() async{
    try {
      getToken();
      Response response =  await dio.post(
        postUri,
        data: {
          "title": title.text,
          "content": body.text,
          "tag": tag.text,
          "owner": 9
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $userApiToken",
          },
        )
      );
      print(response);
    } catch (e) {
      print(e);
      print(registerUserId);
    }
  }

  checkPostFormInputs(){
    if(title.text.isNotEmpty && body.text.isNotEmpty){
      createPost();
    } else if(title.text.isEmpty && body.text.isEmpty ){
      setState(() {
        hasConcernBool = true;
        hasConcern = "Adding tags makes it easy to understand your problem.";
      });
    }
  }

  Future<void> getToken() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String? action = prefs.getString('jwtToken');
  action = userApiToken; 
}
}