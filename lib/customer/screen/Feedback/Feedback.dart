import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class UserFeedbackForm extends StatefulWidget {
  UserFeedbackForm({super.key});

  @override
  State<UserFeedbackForm> createState() => _UserFeedbackFormState();
}

class _UserFeedbackFormState extends State<UserFeedbackForm> {
  int _rating = 0;

  final Color firstColor =
  const Color.fromARGB(139, 3, 19, 161);
 // color for top container
  final Color secondColor =
  const Color.fromARGB(255, 197, 206, 216);
 // color for top conatiner
  final msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 310,
                    decoration: BoxDecoration(
                        gradient:
                        LinearGradient(colors: [firstColor, secondColor]),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.blue,
                              blurRadius: 12,
                              offset: Offset(0, 6))
                        ]), // upper container of the screen //
                  ),
                ),
                const Positioned(
                  top: 50,
                  left: 25,
                  child: Text(
                    'Mechanic FeedBack',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const Positioned(
                  top: 85,
                  left: 25,
                  child: Text(
                    "Welcome To Our Feedback Form We Will Be Happy ",
                    style: TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
                const Positioned(
                  top: 105,
                  left: 25,
                  child: Text(
                    "To Know About Your Experience With The Mechanic",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ),

                /*const Positioned(
                top: 130,
                left: 25,
                child: CircleAvatar(
                radius: 50,
                foregroundImage: AssetImage('assetName'),
              ),), */ // here needs to be attached the user profile picture
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.0),
                  child: Text(
                    'Tell Us How We Can Improve',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                          ),
                          child: TextField(
                            controller: msgController,
                            style:
                            const TextStyle(color: Colors.black, fontSize: 15),
                            maxLines: 4,
                            decoration:
                            const InputDecoration(hintText: 'Enter Text Here'),
                          ),
                        ))
                  ],
                ),
                const Center(
                  child: Text(
                    'How Would You Rate Mechanic Experience',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      5,
                          (index) => IconButton(
                          onPressed: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                          // ignore: prefer_const_constructors
                          icon: ColorFiltered(
                            colorFilter: _rating >= index + 1
                                ? const ColorFilter.mode(
                              Colors.yellow,
                              BlendMode.srcIn,
                            )
                                : const ColorFilter.mode(
                              Colors.grey,
                              BlendMode.srcIn,
                            ),
                            child: Icon(
                              Icons.star_border_outlined,
                              color: Colors.grey,
                              size: 32,
                            ),
                          ))),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey, //KButtonColor
                    ),
                    child: MaterialButton(
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Fonts/Oswald-Bold.ttf',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    RotatedBox(
                      quarterTurns: 6,
                      child: ClipPath(
                        clipper: MyClipper(),
                        child: Container(
                          width: double.infinity,
                          height: 280,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [firstColor, secondColor]),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.blue,
                                    blurRadius: 12,
                                    offset: Offset(0, 6))
                              ]),
                        ),
                      ),
                    ),
                    /*Positioned(
                      left: 200,
                      top: 100,
                      child: CircleAvatar(
                        radius: 70,
                        foregroundImage: AssetImage(''),
                      ),
                    ), */ //need to attach the application logo here
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 70);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 300);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
