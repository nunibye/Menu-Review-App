import 'package:flutter/material.dart';
import 'constants.dart' as constants;
import 'package:menu_app/widgets.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});
  @override
  State<Calculator> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<Calculator> {
  static const totalSlugPoints = 1000.0;
  static const mealCost = 8.28;
  // var lastDay = "3 / 24 / 23"; FIXME: should eventuall take a string
  static const lastDay = 10; // FIXME: Right now only how many days left

  final _totalSlugPointsController = TextEditingController(text: totalSlugPoints.toString());
  final _mealCostController = TextEditingController(text: mealCost.toString());
  final _lastDayController = TextEditingController(text: lastDay.toString());

  double _totalSlugPoints = totalSlugPoints;
  double _mealCost = mealCost;
  int _lastDay = lastDay;
  // String _lastDay = lastDay; FIXME

  @override
  void initState() {
    super.initState();
    _totalSlugPointsController.addListener(_onTotalSlugPointsChanged);
    _mealCostController.addListener(_onMealCostChanged);
    _lastDayController.addListener(_onLastDayChanged);
  }

  _onTotalSlugPointsChanged() {
    setState(() {
      _totalSlugPoints =
          double.tryParse(_totalSlugPointsController.text) ?? 0.0;
    });
  }

  _onMealCostChanged() {
    setState(() {
      _mealCost = double.tryParse(_mealCostController.text) ?? 0;
    });
  }

  _onLastDayChanged() {
    setState(() {
      _lastDay = int.tryParse(_lastDayController.text) ?? 0;
    });
  }

  @override
  void dispose() {
    // To make sure we are not leaking anything, dispose any used TextEditingController
    // when this widget is cleared from memory.
    _lastDayController.dispose();
    _mealCostController.dispose();
    _totalSlugPointsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _getMealAmount() =>
        num.parse((_totalSlugPoints / _mealCost / _lastDay).toStringAsFixed(2));

    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: constants.menuHeadingSize,
              fontFamily: 'Monoton',
              color: Color(constants.yellowGold)),
        ),
        toolbarHeight: 60,
        centerTitle: false,
        backgroundColor: const Color(constants.darkBlue),
        shape: const Border(bottom: BorderSide(color: Colors.orange, width: 4)),
      ),
      body: Container(
        color: const Color.fromARGB(255, 198, 197, 197), //FIXME: figure out color problem
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  key: const Key("totalSlugPoints"),
                  controller: _totalSlugPointsController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Slug points balance',
                    labelText: 'Slug points',
                    labelStyle: const TextStyle(
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Color(constants.bodyColor),
                    ),
                    fillColor: const Color(constants.bodyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  key: Key("mealCost"),
                  controller: _mealCostController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Meal cost',
                    labelText: 'Meal cost',
                    labelStyle: const TextStyle(
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Color(constants.bodyColor)),
                    fillColor: const Color(constants.bodyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  key: const Key("lastDay"),
                  controller: _lastDayController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Last day',
                    labelText: 'Last day',
                    labelStyle: const TextStyle(
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Color(constants.bodyColor),
                    ),
                    fillColor: const Color(constants.bodyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: const Color(constants.bodyColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: const Color(constants.bodyColor)),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black12,
                    //     offset: Offset(2, 2),
                    //     spreadRadius: 2,
                    //     blurRadius: 1,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Avg. Meals/Day: ${_getMealAmount()}',
                        key: const Key('mealAmount'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AmountText extends StatelessWidget {
  final String text;

  const AmountText(
    this.text, {
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Text(text.toUpperCase(),
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 20)),
    );
  }
}
