import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_apis_project/models/cart_model/user_cart_model.dart';
import 'package:test_apis_project/views/screens/simple_contain/image_add_cart_screen/image_cart_screen.dart';

class ImageAddScreen extends StatefulWidget {
  const ImageAddScreen({super.key});

  @override
  State<ImageAddScreen> createState() => _ImageAddScreenState();
}

class _ImageAddScreenState extends State<ImageAddScreen> {

  List<UserCartModel> allUsers = [
    UserCartModel(image: 'assets/images/home_boy_pic3.jpg', name: "Yaseen Malik", subtitle: 'App developer'),
    UserCartModel(image: 'assets/images/main_profile.png', name: 'Ahmad Shah', subtitle: 'Web developer'),
    UserCartModel(image: 'assets/images/video_user.jpg', name: 'Basit', subtitle: 'AI Engineer')
  ];

  List<UserCartModel> selectedUsers = [];

 /* List selectedImage = [];
  List selectedName = [];
  List selectedSubtitle = [];

  void addToCart(String image,String name,String title){
    if(!selectedImage.contains(image) && !selectedName.contains(name) && !selectedSubtitle.contains(title)){
      setState(() {
        selectedImage.add(image);
        selectedName.add(name);
        selectedSubtitle.add(title);
      });

    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User data already exists')));
    }
  }
*/

  void addToCart(UserCartModel user){
    if(!selectedUsers.contains(user)){
      setState(() {
        selectedUsers.add(user);
      });
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text('User data already added')));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image add into cart'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
               ImageCartScreen(allData: selectedUsers) ));

              },
                child: Icon(CupertinoIcons.cart)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allUsers.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      addToCart(allUsers[index]);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('User data added')));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(allUsers[index].image),
                      ),
                      title: Text(allUsers[index].name),
                      subtitle: Text(allUsers[index].subtitle),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
