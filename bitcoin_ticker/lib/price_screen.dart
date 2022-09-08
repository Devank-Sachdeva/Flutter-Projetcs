import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'liveData.dart';
import 'package:intl/intl.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  final formatter = NumberFormat.decimalPattern();
  String? selectedCurrency = 'INR';
  String? exchangeRateBTC = ' ';
  String? exchangeRateETH = ' ';
  String? exchangeRateUSDT = ' ';
  LiveData live = LiveData();

  List<DropdownMenuItem<String>> dropDownItemFunc() {
    List<DropdownMenuItem<String>> theItems = [];
    for (String curr in currenciesList) {
      var item = DropdownMenuItem<String>(
        value: curr,
        child: Text(curr),
      );
      theItems.add(item);
    }
    return theItems;
  }

  void updateUI(Map rate) {
    setState(() {
      exchangeRateBTC = formatter.format(rate['BTC']);
      exchangeRateETH = formatter.format(rate['ETH']);
      exchangeRateUSDT = formatter.format(rate['USDT']);
    });
  }

  void getLive(String? curr) async {
    try {
      Map exchangeRates = await live.getData(curr);
      updateUI(exchangeRates);
    } catch (e) {
      alert();
    }
  }

  void alert() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.center,
        title: Center(
            child: Text(
          'Error',
          style: TextStyle(fontSize: 20),
        )),
        content: Text(
          'Error While Fetching The Data',
          style: TextStyle(fontSize: 20),
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
                getLive(selectedCurrency);
              },
              child: const Text('Try Again', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    getLive(selectedCurrency);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Center(child: Text('🤑 Coin Ticker')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Container()),
            buildCard('BTC', exchangeRateBTC),
            buildCard('ETH', exchangeRateETH),
            buildCard('USDT', exchangeRateUSDT),
            Expanded(child: Container()),
            // TextButton(
            //     onPressed: () {
            //       alert();
            //     },
            //     child: Text('he')),
            Container(
              decoration: BoxDecoration(color: Colors.blue[800]),
              height: 80.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              child: DropdownButton<String>(
                value: selectedCurrency,
                items: dropDownItemFunc(),
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value;
                    exchangeRateBTC = ' ';
                    exchangeRateETH = ' ';
                    exchangeRateUSDT = ' ';
                    getLive(selectedCurrency);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildCard(String crypto, String? exchangeRate) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.blue[800],
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $exchangeRate $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
