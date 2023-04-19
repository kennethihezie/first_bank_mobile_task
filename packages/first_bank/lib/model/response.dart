/**
 * Created by collins ihezie on 19/04/23
 */

class StatusResponse{
  final int statusCode;
  final String message;
  final dynamic errors;
  final dynamic data;

  StatusResponse({this.statusCode = 0, this.message = '', this.errors, this.data});

  factory StatusResponse.fromJson(Map json){
    return StatusResponse(
        statusCode: json['statusCode'],
        message: json['message'],
        errors: json['errors'],
        data: json['data']
    );
  }

  Map<String, dynamic> toJson(StatusResponse response){
    return {
      "statusCode" : response.statusCode,
      "message" : response.message,
      "errors" : response.errors,
      "data" : response.data
    };
  }
}