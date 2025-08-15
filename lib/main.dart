import 'package:flutter/material.dart';
import 'package:test_apis_project/views/screens/delete_api/delete_api_screen.dart';
import 'package:test_apis_project/views/screens/get_api/user_get_api_screen.dart';
import 'package:test_apis_project/views/screens/get_api_screen.dart';
import 'package:test_apis_project/views/screens/get_image_api_screen.dart';
import 'package:test_apis_project/views/screens/get_list_screen.dart';
import 'package:test_apis_project/views/screens/get_single_user_data_screen.dart';
import 'package:test_apis_project/views/screens/get_user_post_screen.dart';
import 'package:test_apis_project/views/screens/list_data/list_data_screen.dart';
import 'package:test_apis_project/views/screens/post_api/login_api_screen.dart';
import 'package:test_apis_project/views/screens/post_api/post_api_1_screen.dart';
import 'package:test_apis_project/views/screens/put_api/update_title_api_screen.dart';
import 'package:test_apis_project/views/screens/shared_preferences_module/shared_prefernces_main_screen.dart';
import 'package:test_apis_project/views/screens/simple_contain/cart_item/first_screen.dart';
import 'package:test_apis_project/views/screens/simple_contain/image_add_cart_screen/image_add_screen.dart';
import 'package:test_apis_project/views/screens/simple_contain/s1_screen.dart';
import 'package:test_apis_project/views/screens/user_info_screen/user_info_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:ListDataScreen()
      //UserInfoScreen()
      //SharedPreferncesMainScreen()
      //DeleteApiScreen()
      //UpdateTitleApiScreen()
      //LoginApiScreen()
      //UserGetApiScreen()
      //ImageAddScreen()
      //FirstScreen()
      //HomeScreen()
      //PostApi1Screen()
      //GetListScreen()
      //GetSingleUserDataScreen()
      //GetUserPostScreen()
      //GetImageApiScreen()
      //GetApiScreen(),
    );
  }
}

