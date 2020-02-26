class RESTAPIConsumptionException implements Exception{
  int _statusCode;
  String _url;
  String _reqType;

  RESTAPIConsumptionException(int statusCode, String url, String reqType)
  {
    this._statusCode=statusCode;
    this._url=url;
    if(["GET","POST"].contains(reqType))
      this._reqType=reqType;
    else
      this._reqType=null;
  }

  int getStatusCode()
  {
    return this._statusCode;
  }

  String getUrl()
  {
    return this._url;
  }

  String getReqType()
  {
    return this._reqType;
  }

  String toString()
  {
    return("REST API Failure:"
          +"\nRequest Type:\t"+this._reqType
          +"\nStatus Code:\t"+this._statusCode.toString()
          +"\nURL:\t"+this._url);
  }
}