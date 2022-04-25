import 'package:http/http.dart' as http;

Future<void> postData(String text) async {

  var response = await http.post(
    Uri.parse("https://61it38j72l.execute-api.us-east-1.amazonaws.com/postfunziona"),
    headers: {"Access-Control-Allow-Origin": "*",
"Access-Control-Allow-Credentials": "true", // Required for cookies, authorization headers with HTTPS
  "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
  "Access-Control-Allow-Methods": "POST, OPTIONS"},
    body: text,
  );

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    print(response.statusCode.toString());
  }
}

Future<String> getData() async {
  var response = await http.get(
    Uri.parse("https://y3od21zbh9.execute-api.us-east-1.amazonaws.com/test/customer"),
    headers: {"authorizationToken": 'abc123'},
  );

  if (response.statusCode == 200) {
    String res = response.body;
    res = res.replaceAll(RegExp(r'\\n'), "\n");
    res = res.replaceAll(RegExp(r'\\'), "");
    return res;
  } else {
    return response.statusCode.toString();
  }
}
