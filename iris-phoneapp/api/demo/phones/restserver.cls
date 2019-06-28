Class demo.phones.restserver Extends %CSP.REST
{

/// This parameter influences the CORS support. The default is an empty string meaning 'not specified'.
/// If set to true (1) then CORS processing is ON. If set to false (0) then CORS processing is OFF.
/// If left unset ("") then the decision to process CORS is delegated to the setting on the URL map route.
Parameter HandleCorsRequest = 1;

/// REST API for demo phonemarketapp AngularJS application (WITS2016)
/// 
/// Prerequisites:
/// ------------
/// Create new Web-App for Web-Application in SMP: /phoneapp
/// Copy all the demo phoneapp files/folders into your Web-Apps /CSP/phoneapp physical folder.
/// Create new Web-App for RESTAPI in SMP: /phoneapp/api -> Dispatcher class = demo.phones.restserver
/// 
Parameter CONTENTTYPE As %String = "application/json";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/test" Method="GET" Call="Test" />
<Route Url="/phones" Method="GET" Call="GetAllPhones" />
<Route Url="/phones/:id" Method="GET" Call="GetPhone" />
<Route Url="/phones/new" Method="POST" Call="CreatePhone" />
<Route Url="/phones/:id" Method="PUT" Call="UpdatePhone" />
<Route Url="/phones/:id" Method="DELETE" Call="DeletePhone" />
</Routes>
}

/// Write list of phones as JSON
ClassMethod GetAllPhones() As %Status
{
	set tArr = []
	
	&sql(DECLARE C1 CURSOR FOR SELECT ID INTO :id FROM demo_phones.phone)
	&sql(OPEN C1)
	&sql(FETCH C1)
	while (SQLCODE = 0) {
		set phObj = ##class(demo.phones.phone).%OpenId(id)
		do tArr.%Push(phObj.ToJsonObject())
		&sql(FETCH C1)
	}
	&sql(CLOSE C1)
	
	// Write to HTTP device
	write tArr.%ToJSON()
	
	quit $$$OK
}

ClassMethod Test() As %Status
{
	set o={"manufacturer":"Apple","model":"iPhone 6 SE","price":123.45,"img":"/img/test-greenphone.png"}
	w o.%ToJSON()
	quit $$$OK
}

ClassMethod GetPhone(id As %String) As %Status
{
	set phObj = ##class(demo.phones.phone).%OpenId(id)
	if '$IsObject(phObj) {
		set %response.Status = ..#HTTP404NOTFOUND
	} else {
		write phObj.ToJsonString()
	}
	quit $$$OK
}

/// Helper method
ClassMethod GetJSONFromRequest(Output obj As %DynamicObject) As %Boolean
{
	Set ok = 1
	Try {
		Set obj = ##class(%DynamicObject).%FromJSON(%request.Content)
	} Catch ex {
		Set ok = 0
	}
	Quit ok
}

/// Helper method
ClassMethod ValidateJSON(obj As %DynamicObject, Output error As %DynamicObject) As %Boolean
{
	Set error = {}
	
	If obj.%Get("model") = "" {
		Set error.errormessage = "Model was blank"
		Quit 0
	}	
	
	If obj.%Get("manufacturer") = "" {
		Set error.errormessage = "Manufacturer was blank"
		Quit 0
	}
	
	Quit 1
}

/// Takes JSON object from HTTP request and create the phone.
/// Returns an error if the 'model' or 'manufacturer' fields are left blank.
ClassMethod CreatePhone() As %Status
{
	If '..GetJSONFromRequest(.obj) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Set error = {"errormessage": "JSON not found"}
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	If '..ValidateJSON(obj,.error) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	Set p = ##class(demo.phones.phone).%New()
	Do ##class(demo.phones.phone).CopyFromJSON(.p,obj)
	Set sc = p.%Save()
	
	Set result={}
	do result.%Set("status",$s($$$ISERR(sc):$system.Status.GetOneErrorText(sc),1:"OK"))
	write result.%ToJSON()
	quit sc
}

/// Takes JSON object from HTTP request and updates the specified phone ID.
/// Returns an error if the 'model' or 'manufacturer' fields are left blank.
ClassMethod UpdatePhone(id As %String = "") As %Status
{
	If '..GetJSONFromRequest(.obj) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Set error = {"errormessage": "JSON not found"}
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	If '..ValidateJSON(obj,.error) {
		Set %response.Status = ..#HTTP400BADREQUEST
		Write error.%ToJSON()
		Quit $$$OK
	}
	
	Set p = ##class(demo.phones.phone).%OpenId(id)
	If '$IsObject(p) {
		Set %response.Status = ..#HTTP404NOTFOUND
		Quit $$$OK
	}
	
	Do ##class(demo.phones.phone).CopyFromJSON(.p,obj)
	
	Set sc = p.%Save()
	
	Set result={}
	do result.%Set("Status",$s($$$ISERR(sc):$system.Status.GetErrorText(sc),1:"OK"))
	write result.%ToJSON()
	Quit sc
}

ClassMethod DeletePhone(id As %String = "") As %Status
{
	
	Set result={}
	Set sc=$$$OK
	
	if id'="",##class(demo.phones.phone).%ExistsId(id) {
	  Set sc=##class(demo.phones.phone).%DeleteId(id)
	  do result.%Set("Status",$s($$$ISERR(sc):$system.Status.GetErrorText(sc),1:"OK"))
	}
	else  {
		set %response.Status = ..#HTTP404NOTFOUND
		quit $$$OK
	}
	
	write result.%ToJSON()
  	quit sc
}

}
