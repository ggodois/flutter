import 'dart:convert';
import 'package:http/http.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = '3375D8C7-F3FB-40EE-A15F-9AE775EC3C92';

class CoinData {
  Future getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      var url = Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency');
      Map<String, String> headers = {'X-CoinAPI-Key': '$apiKey'};
      var result = await get(url, headers: headers);

      if (result.statusCode == 200) {
        cryptoPrices[crypto] =
            jsonDecode(result.body)['rate'].toStringAsFixed(0);
      } else {
        print(result.statusCode);
        throw 'Error to convert';
      }
    }
    return cryptoPrices;
  }
}
