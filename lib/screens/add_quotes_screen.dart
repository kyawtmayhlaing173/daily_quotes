import 'package:daily_quotes/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddQuoteScreen extends StatefulWidget {
  const AddQuoteScreen({Key? key}) : super(key: key);

  @override
  State<AddQuoteScreen> createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  List patternList = [
    'https://i.pinimg.com/750x/1a/5e/08/1a5e08d96569914066d8d72c9d4074c5.jpg',
    'https://i.pinimg.com/750x/ce/82/b4/ce82b4c31b7ef1e83d9abd5871a19887.jpg',
    'https://i.pinimg.com/750x/9f/28/53/9f2853ba46e192f37567d76dd82735d7.jpg',
    'https://i.pinimg.com/750x/97/09/f5/9709f5a3e2b8c7b387aff8cceec75438.jpg',
    'https://i.pinimg.com/750x/df/cb/ab/dfcbab557e5376a2d8099a30b463a369.jpg',
    'https://i.pinimg.com/750x/76/75/75/767575586ac6856e9b2527280808347e.jpg',
    'https://i.pinimg.com/750x/51/c1/61/51c161810d0efc6df6ca84a3d997682a.jpg',
    'https://i.pinimg.com/750x/93/43/1d/93431d3d00449fa6b8cd7040b3e9b417.jpg',
    'https://i.pinimg.com/750x/14/fe/e9/14fee941e55fa5066fdd33dc22609b3d.jpg',
    'https://i.pinimg.com/750x/87/5e/94/875e947c3bd8aa363c38363a341ae764.jpg',
    'https://i.pinimg.com/750x/d5/58/30/d5583062d79290ec56b6cb4d5f667239.jpg',
    'https://i.pinimg.com/750x/1d/92/b6/1d92b644a3570db9a141c28777c0695a.jpg',
    'https://i.pinimg.com/750x/30/3d/94/303d9440f0734e932797e3b716532274.jpg',
    'https://i.pinimg.com/750x/a9/0e/aa/a90eaa9dfaf2d8265e421aaa0a2f73c6.jpg',
    'https://i.pinimg.com/750x/f6/87/36/f687365243f3109529e7dde8e711439a.jpg',
    'https://i.pinimg.com/564x/4c/d3/02/4cd302d1c2d1211f07c168d01f77dbaa.jpg',
    'https://i.pinimg.com/564x/8f/5c/ed/8f5cedba91848aefd31b0cf4ec859478.jpg',
    'https://i.pinimg.com/564x/e7/8e/c0/e78ec0c40ca259a781e5520eff0aa723.jpg',
    'https://i.pinimg.com/564x/20/36/31/203631ce20e2c5efef985998c5359bb7.jpg',
    'https://i.pinimg.com/564x/10/86/a4/1086a4ccc2767a5248c01c289ffa6373.jpg',
    'https://i.pinimg.com/564x/ef/95/17/ef9517049c0530bc07700ef71bd0b675.jpg',
    'https://i.pinimg.com/564x/0d/29/8f/0d298f2a32dc5ad696e97883223a6e7b.jpg',
    'https://i.pinimg.com/564x/ca/50/69/ca5069c195b26b476a7b8f803782413a.jpg',
    'https://i.pinimg.com/564x/dd/e2/21/dde221818d1356704fa4ad3bdd47e1d1.jpg',
  ];
  int _selectedIndex = 0;
  String _selectedPattern =
      'https://i.pinimg.com/750x/1a/5e/08/1a5e08d96569914066d8d72c9d4074c5.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _editButtonContainer(),
            const Text(
              'Design',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _editTextContainer(),
            const SizedBox(height: 20),
            _patternList(),
          ],
        ),
      )),
    );
  }

  _editButtonContainer() {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: Container()),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Next",
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  _editTextContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        image: DecorationImage(
          image: NetworkImage(_selectedPattern),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            maxLines: 10,
            autofocus: true,
            enabled: true,
            style: GoogleFonts.montserrat(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _patternList() {
    return Flexible(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: patternList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
                _selectedPattern = patternList[_selectedIndex];
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(patternList[index]),
                  fit: BoxFit.cover,
                ),
                border: _selectedIndex == index
                    ? Border.all(color: kPrimaryColor, width: 2)
                    : Border.all(color: kPrimaryColor, width: 0),
              ),
            ),
          );
        },
      ),
    );
  }
}
