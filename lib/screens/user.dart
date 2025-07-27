import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressTextController = TextEditingController(
    text: "",
  );

  @override
  void dispose() {
    // TODO: implement dispose
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Hi,   ",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sadik",
                        style: TextStyle(
                          color: color,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Handle tap on "Sadik"
                            print("my name is pressed");
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                TextWidget(text: "sksad@gmail.com", color: color, textSize: 22),
                const SizedBox(height: 20),
                Divider(thickness: 2),
                const SizedBox(height: 20),
                _listTiles(
                  title: "Address 2",
                  icon: IconlyBold.profile,
                  subtitle: "my subtitle",
                  color: color,
                  onPressed: () async {
                    await _showAddressDialog();
                  },
                ),

                _listTiles(
                  title: "Orders",
                  color: color,
                  icon: IconlyBold.bag,
                  onPressed: () {},
                ),

                _listTiles(
                  title: "Wiishlist",
                  icon: IconlyBold.bag,
                  color: color,

                  onPressed: () {},
                ),
                _listTiles(
                  title: "Viewd",
                  color: color,
                  icon: IconlyBold.show,
                  onPressed: () {},
                ),

                _listTiles(
                  title: "Forget password",
                  icon: IconlyBold.unlock,
                  color: color,
                  onPressed: () {},
                ),

                SwitchListTile(
                  title: TextWidget(
                    text: themeState.getDarkTheme ? "Dark mode" : "Light mode",
                    color: color,
                    textSize: 18,
                  ),

                  secondary: Icon(
                    themeState.getDarkTheme
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      themeState.setDarkTheme = value;
                    });
                    // This is where you would handle the switch change
                  },
                  value: themeState.getDarkTheme,
                ),

                _listTiles(
                  title: "Logout",
                  icon: IconlyBold.logout,

                  onPressed: ()  {
                    
                  },
                  color: color,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> _showLogoutDialog() async {
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Row(
  //           children: [
  //             Image.asset(
  //               "assets/images/warning-sign.png",
  //               height: 20,
  //               width: 20,
  //               fit: BoxFit.fill,
  //             ),
  //             SizedBox(width: 8),
  //             const Text("SIgn out"),
  //           ],
  //         ),
  //         content: const Text("Do you wanna sign out?"),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               if (Navigator.canPop(context)) {
  //                 Navigator.of(context).pop();
  //               }
  //               // Close the dialog
  //             },
  //             child: TextWidget(
  //               text: "CANCEL",
  //               color: Colors.cyan,
  //               textSize: 18,
  //             ),
  //           ),
  //           TextButton(
  //             onPressed: () {},
  //             child: TextWidget(text: "ok", color: Colors.red, textSize: 18),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> _showAddressDialog() async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("update"),
          content: TextField(
            // onChanged: (value) {
            //   _addressTextController.text;

            // },
            controller: _addressTextController,
            maxLines: 5,
            decoration: InputDecoration(hintText: "Enter your address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Handle save action
              },
              child: const Text("Update"),
            ),
            TextButton(
              onPressed: () {
                // Handle cancel action
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  Widget _listTiles({
    required String title,
    required IconData icon,
    String? subtitle,
    required Function onPressed,
    required Color color,
  }) {
    return ListTile(
      title: TextWidget(text: title, color: color, textSize: 22),
      subtitle: TextWidget(
        text: subtitle == null ? "" : subtitle,
        color: color,
        textSize: 18,
      ),

      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () => onPressed(),
    );
  }
}
