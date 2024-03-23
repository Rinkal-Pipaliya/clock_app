import 'dart:math';
import 'package:flutter/material.dart';

import '../components/clock_options.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime d = DateTime.now();

  bool _isAnalog = false;
  bool _isStrap = false;
  bool _isDigital = false;
  bool _image = false;

  void startClock() {
    Future.delayed(const Duration(seconds: 1), () {
      d = DateTime.now();
      setState(() {});
      startClock();
    });
  }

  @override
  void initState() {
    super.initState();
    startClock();
  }

  final List<String> _bgImages = [
    "https://4kwallpapers.com/images/wallpapers/dark-background-abstract-background-network-3d-background-3840x2160-8324.png",
    "https://img.freepik.com/free-vector/abstract-technological-background_23-2148897676.jpg",
    "https://e0.pxfuel.com/wallpapers/741/410/desktop-wallpaper-black-phone-25-top-black-phone-black-for-mobile-thumbnail.jpg",
    "https://img.freepik.com/free-photo/blockchain-technology-background-gradient-blue_53876-124648.jpg",
    "data:image/jpeg;base64,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",
  ];

  int _selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Clock Page"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            //Header
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: NetworkImage(
                    "https://edug.in/panel/head_admin/School/school_head/first_photo/DEMO59167.jpg"),
              ),
              accountName: Text("Demo account"),
              accountEmail: Text("dummy@mail.io"),
            ),
            //Options
            clockOptionTile(
              title: "Analog clock",
              val: _isAnalog,
              onChanged: (val) => setState(
                () => _isAnalog = !_isAnalog,
              ),
            ),
            clockOptionTile(
              title: "Strap clock",
              val: _isStrap,
              onChanged: (val) => setState(
                () => _isStrap = !_isStrap,
              ),
            ),
            clockOptionTile(
              title: "Digital clock",
              val: _isDigital,
              onChanged: (val) => setState(
                () => _isDigital = !_isDigital,
              ),
            ),
            clockOptionTile(
              title: "Image",
              val: _image,
              onChanged: (val) => setState(
                () => _image = !_image,
              ),
            ),
            Visibility(
              visible: _image,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _bgImages
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            _selectedImage = _bgImages.indexOf(e);
                            setState(() {});
                          },
                          child: Container(
                            height: 80,
                            width: 80,
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: _bgImages.indexOf(e) == _selectedImage
                                  ? Border.all(color: Colors.grey)
                                  : null,
                              image: DecorationImage(
                                image: NetworkImage(e),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: _image
              ? DecorationImage(
                  image: NetworkImage(
                    _bgImages[_selectedImage],
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            //BG
            Container(
              height: size.height * 0.63,
              width: size.height * 0.63,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
            //AnalogClock
            Visibility(
              visible: _isAnalog,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //allDials
                  ...List.generate(
                    60,
                    (index) => Transform.rotate(
                      angle: index * (pi * 2) / 60,
                      child: Divider(
                        endIndent: index % 5 == 0
                            ? size.width * 0.88
                            : size.width * 0.9,
                        thickness: 2,
                        color: index % 5 == 0 ? Colors.red : Colors.grey,
                      ),
                    ),
                  ),
                  //hourHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.hour * (pi * 2) / 12,
                      child: Divider(
                        indent: 50,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.black,
                        thickness: 4,
                      ),
                    ),
                  ),
                  //minuteHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.minute * (pi * 2) / 60,
                      child: Divider(
                        indent: 30,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.black,
                        thickness: 2,
                      ),
                    ),
                  ),
                  //secondHand
                  Transform.rotate(
                    angle: pi / 2,
                    child: Transform.rotate(
                      angle: d.second * (pi * 2) / 60,
                      child: Divider(
                        indent: 20,
                        endIndent: size.width * 0.5 - 16,
                        color: Colors.red,
                        thickness: 2,
                      ),
                    ),
                  ),
                  //dot
                  const CircleAvatar(
                    radius: 10,
                  ),
                ],
              ),
            ),
            //StrapClock
            Visibility(
              visible: _isStrap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //HourStrap
                  Transform.scale(
                    scale: 9,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      value: d.hour / 12,
                    ),
                  ),
                  //MinuteStrap
                  Transform.scale(
                    scale: 7,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.3,
                      value: d.minute / 60,
                    ),
                  ),
                  //SecondStrap
                  Transform.scale(
                    scale: 4,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      value: d.second / 60,
                    ),
                  ),
                ],
              ),
            ),
            //DigitalClock
            Visibility(
              visible: _isDigital,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${d.hour}:${d.minute}:${d.second}",
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
