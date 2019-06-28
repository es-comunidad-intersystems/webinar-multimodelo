Class demo.phones.phone Extends %Persistent
{

Property manufacturer As %String;

Property model As %String;

Property resolution As %String;

Property cpu As %String;

Property cputype As %String;

Property ram As %String;

Property battery As %String;

Property dimensions As %String(MAXLEN = 256);

Property os As %String;

Property released As %String;

Property img As %String(MAXLEN = 256);

Property price As %String;

Property phoneID As %Integer [ Calculated, SqlComputeCode = { Set {*} = {ID} }, SqlComputed ];

ClassMethod DummyData() As %DynamicArray [ Private ]
{
	Quit [
	  {
	    "manufacturer":"Sony",
	    "model":"Xperia Z3",
	    "resolution":"1920x1080",
	    "cpu":"Qualcomm Snapdragon 801 MSM8974AC",
	    "cputype":"Quad-Core",
	    "ram":"3 GByte",
	    "battery":"3.100mAh",
	    "dimensions":"146 x 72 x 7.3 mm",
	    "os":"Android Version: 5.1.1 Lollipop",
	    "released":"09/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Sony",
	    "model":"Xperia Z2",
	    "resolution":"1920x1080",
	    "cpu":"Qualcomm MSM8974AB Snapdragon 800",
	    "cputype":"Quad-Core",
	    "ram":"3 GByte",
	    "battery":"3.200mAh",
	    "dimensions":"146.8 x 73.3 x 8.2 mm",
	    "os":"Android Version: 5.0.2 Lollipop",
	    "released":"04/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Apple",
	    "model":"iPhone 6",
	    "resolution":"1334x750",
	    "cpu":"Apple A8 64-Bit M8 Motion Cop",
	    "cputype":"Dual-Core",
	    "ram":"1 GByte",
	    "battery":"1.810mAh",
	    "dimensions":"138.1 x 67 x 6.9 mm",
	    "os":"iOS Version: 8.4",
	    "released":"09/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Apple",
	    "model":"iPhone 6s plus",
	    "resolution":"1920x1080",
	    "cpu":"Apple A9 64-Bit",
	    "cputype":"Dual-Core",
	    "ram":"2 GByte",
	    "battery":"2.750mAh",
	    "dimensions":"158.2 x 77.9 x 7.3 mm",
	    "os":"iOS Version: 9",
	    "released":"09/2015",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Google",
	    "model":"Nexus 6",
	    "resolution":"2560x1440",
	    "cpu":"Qualcomm Snapdragon 805 32-Bit",
	    "cputype":"Quad-Core",
	    "ram":"3 GByte",
	    "battery":"3.220mAh",
	    "dimensions":"159.26 x 82.98 x 10.06 mm",
	    "os":"Android Version: 5.1 Lollipop",
	    "released":"11/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"HTC",
	    "model":"One (M8)",
	    "resolution":"1920x1080",
	    "cpu":"Qualcomm Snapdragon 801 32-Bit",
	    "cputype":"Quad-Core",
	    "ram":"2 GByte",
	    "battery":"2.600mAh",
	    "dimensions":"146.36 x 70.6 x 9.35 mm",
	    "os":"Android Version: 5.0.1 Lollipop",
	    "released":"04/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"LG",
	    "model":"G4",
	    "resolution":"2560x1440",
	    "cpu":"Qualcomm Adreno 418",
	    "cputype":"Hexa-Core",
	    "ram":"3 GByte",
	    "battery":"3.000mAh",
	    "dimensions":"148.9 x 76.1 x 10.7 mm",
	    "os":"Android Version: 5.1 Lollipop",
	    "released":"06/2015",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Samsung",
	    "model":"Galaxy S7 edge",
	    "resolution":"2560x1440",
	    "cpu":"Samsung Exynos 8890 64-Bit",
	    "cputype":"Octa-Core",
	    "ram":"4 GByte",
	    "battery":"3.600mAh",
	    "dimensions":"150.9 x 72.6 x 7.7 mm",
	    "os":"Android Version: 6.0.1 Marshmallow",
	    "released":"03/2016",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Nokia",
	    "model":"Lumia 930",
	    "resolution":"1920x1080",
	    "cpu":"Qualcomm Snapdragon 800 32-Bit",
	    "cputype":"Quad-Core",
	    "ram":"2 GByte",
	    "battery":"2.420mAh",
	    "dimensions":"137 x 71 x 10.5 mm",
	    "os":"Windows Phone Version 8.1",
	    "released":"06/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Samsung",
	    "model":"Galaxy Note 4",
	    "resolution":"2560x1440",
	    "cpu":"Qualcomm Snapdragon 805 32-Bit",
	    "cputype":"Quad-Core",
	    "ram":"3 GByte",
	    "battery":"3.220mAh",
	    "dimensions":"153.5 x 78.6 x 8.5 mm",
	    "os":"Android Version: 5.0.1 Lollipop",
	    "released":"10/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Huawei",
	    "model":"Mate 8",
	    "resolution":"1920x1080",
	    "cpu":"Kirin 950 64-Bit",
	    "cputype":"Octa-Core",
	    "ram":"3 GByte",
	    "battery":"4.000mAh",
	    "dimensions":"157.1 x 80.6 x 7.9 mm",
	    "os":"Android Version: 6.0 Marshmallow",
	    "released":"01/2015",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Huawei",
	    "model":"Honor 6",
	    "resolution":"1920x1080",
	    "cpu":"HiSilicon Kirin 920 32-Bit",
	    "cputype":"Dual-Core",
	    "ram":"3 GByte",
	    "battery":"3.100mAh",
	    "dimensions":"139.3 x 68.8 x 7.8 mm",
	    "os":"Android Version: 4.4 KitKat",
	    "released":"10/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"LG",
	    "model":"G3",
	    "resolution":"2560x1440",
	    "cpu":"Qualcomm Snapdragon 801 MSM8975AC 32-Bit",
	    "cputype":"Quad-Core",
	    "ram":"2 GByte",
	    "battery":"3.000mAh",
	    "dimensions":"146.3 x 74.6 x 8.95 mm",
	    "os":"Android Version: 5.0.1 KitKat",
	    "released":"07/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"OnePlus",
	    "model":"One",
	    "resolution":"1920x1080",
	    "cpu":"Qualcomm Snapdragon 801 MSM8974AC 32-Bit",
	    "cputype":"Quad-Core",
	    "ram":"3 GByte",
	    "battery":"3.100mAh",
	    "dimensions":"152.9 x 75.9 x 8.9 mm",
	    "os":"Android Version 5.1 Lollipop / CyanogenOS 12",
	    "released":"06/2014",
	    "img":"",
		"price":""
	  },
	  {
	    "manufacturer":"Motorola",
	    "model":"Moto X Play",
	    "resolution":"1920x1080",
	    "cpu":"Qualcomm Snapdragon 615 64-Bit",
	    "cputype":"Octa-Core",
	    "ram":"2 GByte",
	    "battery":"3.630mAh",
	    "dimensions":"148 x 75 x 10.9 mm",
	    "os":"Android Version: 5.1.1 Lollipop",
	    "released":"08/2015",
	    "img":"",
		"price":""
	  }
	]
}

ClassMethod CreateData()
{
	Set response = ..DummyData()
	Quit:'$IsObject(response)
	Quit:response.%Size()<1
	
	do ..%KillExtent()
	
	w !,"importing phones ...",!
	
	set obj={},ok=0,x=0
 
	For i=1:1:response.%Size() {
	  set obj=response.%Pop()
	  Quit:'$IsObject(obj)
	  
	  set x=x+1
	  w !,"phone "_x_" : "
	  do obj.%ToJSON()
	  
	  set pO=##class(demo.phones.phone).%New()
	  do ##class(demo.phones.phone).CopyFromJSON(.pO,obj)
	  
	  if $IsObject(pO) {
		
		//auto generated img filename if not given source-data
		set pO.img="img/"_$zconvert($tr(pO.manufacturer_"_"_pO.model," ","_"),"L")_".jpg"  
		
		//auto generated price if not given in source-data
		set price=$random(5)+1,pO.price=$s(price=1:"199.99",price=2:"299.99",price=3:"399.99",price=4:"499.99",1:"599.99")
		
		set sc=pO.%Save()
		if $$$ISERR(sc) {
			w !,$system.Status.GetOneErrorText(sc)
		}
		else  {
			set ok=ok+1
			w !,"phone Saved OK! (Id:"_pO.%Id()_")"
		} 
	  }
	  
	}
	
	w !!,"Import finished! ",ok,"/",x," phones saved!",!
		
	Quit
}

ClassMethod CopyFromJSON(ByRef p As demo.phones.phone, obj As %DynamicObject)
{
	Set p.model=obj.model
	Set p.manufacturer=obj.manufacturer
	Set p.cpu=obj.cpu
	Set p.price=obj.price
	Set p.img=obj.img
	Set p.resolution=obj.resolution
	Set p.cputype=obj.cputype
	Set p.ram=obj.ram
	Set p.battery=obj.battery
	Set p.dimensions=obj.dimensions
	Set p.os=obj.os
	Set p.released=obj.released
}

Method ToJsonObject() As %DynamicObject
{
   quit {"id":(..%Id()),
         "manufacturer":(..manufacturer),
		 "model":(..model),
		 "resolution":(..resolution),
		 "cpu":(..cpu),
		 "cputype":(..cputype),
		 "ram":(..ram),
		 "battery":(..battery),
		 "dimensions":(..dimensions),
		 "os":(..os),
		 "released":(..released),
		 "img":(..img),
		 "price":(..price)}
}

Method ToJsonString() As %String
{
	quit ..ToJsonObject().%ToJSON()
}

Storage Default
{
<Data name="phoneDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>manufacturer</Value>
</Value>
<Value name="3">
<Value>model</Value>
</Value>
<Value name="4">
<Value>resolution</Value>
</Value>
<Value name="5">
<Value>cpu</Value>
</Value>
<Value name="6">
<Value>cputype</Value>
</Value>
<Value name="7">
<Value>ram</Value>
</Value>
<Value name="8">
<Value>battery</Value>
</Value>
<Value name="9">
<Value>dimensons</Value>
</Value>
<Value name="10">
<Value>os</Value>
</Value>
<Value name="11">
<Value>released</Value>
</Value>
<Value name="12">
<Value>img</Value>
</Value>
<Value name="13">
<Value>price</Value>
</Value>
<Value name="14">
<Value>dimensions</Value>
</Value>
</Data>
<DataLocation>^demo.phones.phoneD</DataLocation>
<DefaultData>phoneDefaultData</DefaultData>
<IdLocation>^demo.phones.phoneD</IdLocation>
<IndexLocation>^demo.phones.phoneI</IndexLocation>
<StreamLocation>^demo.phones.phoneS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
