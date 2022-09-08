import 'package:http/http.dart' as http;
import 'dart:convert';

const startingURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'your api key';
const cryptoList = ['BTC', 'ETH', 'USDT'];

class LiveData {
  Future getData(String? curr) async {
    Map<String, double> dataList = {};
    for (String crypto in cryptoList) {
      http.Response data = await http
          .get(Uri.parse('$startingURL/$crypto/$curr?apikey=$apiKey'));
      if (data.statusCode == 200) {
        double decodedData = await jsonDecode(data.body)['rate'];
        decodedData = double.parse((decodedData).toStringAsFixed(2));
        dataList[crypto] = decodedData;
      } else {
        print(data.statusCode);
        throw 'Problem with the get request';
      }
    }
    print(dataList);
    return dataList;
  }
}
