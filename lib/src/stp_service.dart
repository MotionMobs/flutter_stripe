import 'dart:io';
import 'dart:async';
import 'dart:convert';

/// Handles network requests and responses
class STPService {
  /// Builds a post request with the body, to the specified endpoint
  static Future<Map> postRequest(String endpoint, Map body, String key) async {
    var method = 'POST';
    var encodedBody = UTF8.encode(encodeMap(body));
    HttpClientRequest req = await request(endpoint, method, key);
    req.headers.add('Content-Type', 'application/x-www-form-urlencoded');
    req.headers.add('Content-Length', encodedBody.length);
    req.add(encodedBody);
    return await handleResponse(req);
  }

  /// Builds a request to the specified endpoint using the given method
  static Future<HttpClientRequest> request(String endpoint, String method, String key) async {
    final uri = new Uri(scheme: 'https', host: 'api.stripe.com', path: '/v1${endpoint}' , userInfo: key);
    var client = new HttpClient();
    var req = await client.openUrl(method, uri);
    return req;
  }

  /// Parses response into JSON
  static Future<Map> handleResponse(HttpClientRequest req) async {
    var response = await req.close();
    var bodyData = await response.transform(UTF8.decoder).toList();
    var respBody = bodyData.join('');
    return JSON.decode(respBody);
  }

  /// Takes a map, and returns a properly escaped Uri String.
  /// Original Source:
  /// https://gitlab.com/exitlive/stripe-dart/blob/master/lib/src/service.dart#L118
  static String encodeMap(final Map data) {
    var output = [];
    for (String k in data.keys) {
      if (data[k] is Map) {
        var hasProps = false;
        for (String kk in data[k].keys) {
          hasProps = true;
          output.add(
            Uri.encodeComponent('${k}[${kk}]')
              + '='
              + Uri.encodeComponent(data[k][kk].toString())
          );
        }
        if (!hasProps) {
          output.add(Uri.encodeComponent(k) + '=');
        }
      } else if (data[k] is List) {
        for (String v in data[k]) {
          output.add(
            Uri.encodeComponent('${k}[]')
              + '='
              + Uri.encodeComponent(v)
          );
        }
      } else if (data[k] is int) {
        output.add(
          Uri.encodeComponent(k)
            + '='
            + data[k].toString()
        );
      } else {
        output.add(
          Uri.encodeComponent(k)
            + '='
            + Uri.encodeComponent(data[k])
        );
      }
    }
    return output.join('&');
  }
}