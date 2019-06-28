Class demo.setup Extends %RegisteredObject
{

ClassMethod setup(nsp As %String = "USER", webapp As %String = "/phoneapp")
{
	Do ..createCspPhoneappApi(nsp, webapp)
	Do ##class(demo.phones.phone).CreateData()
}

ClassMethod createCspPhoneappApi(nsp As %String = "USER", webapp As %String = "/phoneapp") [ Private ]
{
	Set oldNS = $namespace
	Set $namespace = "%SYS"
	Set app = ##class(Security.Applications).%New()
	Set app.Name = webapp_"/api"
	Set app.NameSpace = nsp
	Set app.DispatchClass = "demo.phones.restserver"
	set MatchRole = ":%ALL"
    do app.MatchRoles.Insert(MatchRole)
	Set sc = app.%Save()

	Set $namespace = oldNS
	Quit ''sc
}

ClassMethod reset(webapp As %String = "/phoneapp")
{
	Set oldNS = $namespace
	Set $namespace = "%SYS"
	Do ##class(Security.Applications).%DeleteId(webapp_"/api")
	Set $namespace = oldNS
}

}
