strJsonData = "{""username"": ""テスト送信"",""icon_emoji"": "":bot-icon:"",""text"": ""個人専用""}"
strPostAuthData = "username=admin&secretkey=PASSWORD"
strUri     = "https://mysql.koganeitriathlon.biz/logincheck"
strResult = postDataOnHttp(strJsonData,strUri)
'msgbox(strResult)

'strUri     = "https://mysql.koganeitriathlon.biz/api/v2/cmdb/firewall/policy"
'strResult = getDataOnHttp(strUri)
''msgbox(strResult)

Function postDataOnHttp(Byval strPostData ,ByVal strQuery)
  set xmlHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0")
  xmlHTTP.setOption 2, 13056 ' 証明書のエラーを無視する
  set xmlDoc = CreateObject("Msxml2.DOMDocument")
  xmlHTTP.open "POST", strQuery, false
  xmlHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
  xmlHTTP.send(strPostData)
  xmlDoc.async = false
  xmlDoc.loadXML(xmlHTTP.responseText)
  strHeaders = xmlHTTP.getAllResponseHeaders()

  strCcsrftokenKey = pickupByRegExp(xmlHTTP.GetResponseHeader("Set-Cookie"),"_(\d){10}=",1,"_","=")
  strCcsrftokenVal = pickupByRegExp(convBytes2SJIS(xmlHTTP.responseBody),"/([0-9,a-f,A-F]){32}/",1,"/","/")
'''  msgbox("strCcsrftokenKey = " & strCcsrftokenKey & chr(13) & "strCcsrftokenVal = " & strCcsrftokenVal)

  strNow = Replace(Replace(Replace(Now,"/",""),":","")," ","")
  RESPONSE_TEXT = "C:\Users\junic\Desktop\forti\response_" & strNow & "_001.txt"
  Set oStream = CreateObject("ADODB.Stream")
  oStream.Open
  oStream.Type = 1
  oStream.Write xmlHTTP.responseBody
  oStream.SaveToFile RESPONSE_TEXT
  oStream.Close
  postDataOnHttp = xmlHTTP.responseText
  Set oStream = Nothing

'    msgbox(xmlHTTP.responseText)
'    msgbox(xmlHTTP.GetResponseHeader("Server"))
'    msgbox(xmlHTTP.GetResponseHeader("Set-Cookie"))
'    msgbox(xmlHTTP.GetResponseHeader("Set-Cookie: APSCOOKIE_2368703245"))
'    msgbox(xmlHTTP.GetResponseHeader("APSCOOKIE_2368703245"))
'    msgbox(xmlHTTP.GetResponseHeader("Set-Cookie"))
'    msgbox(xmlHTTP.GetResponseHeader("Set-Cookie"))
'    msgbox(xmlHTTP.GetResponseHeader("Transfer-Encoding"))
'    msgbox(xmlHTTP.GetResponseHeader("Content-Type"))
'    msgbox(xmlHTTP.GetResponseHeader("X-Frame-Options"))
'    msgbox(xmlHTTP.GetResponseHeader("Content-Security-Policy"))
'    msgbox(xmlHTTP.GetResponseHeader("X-UA-Compatible"))
strAllHeaders = xmlHTTP.getAllResponseHeaders()
'msgbox(strAllHeaders)

Set objFso = CreateObject("Scripting.FileSystemObject")
Set objFile = objFso.OpenTextFile("C:\Users\junic\Desktop\forti\response_" & strNow & "_000.txt", 8, True)
If Err.Number > 0 Then
    WScript.Echo "Open Error"
Else
    objFile.WriteLine strAllHeaders
End If

objFile.Close
Set objFile = Nothing
Set objFso = Nothing

    strUri     = "https://mysql.koganeitriathlon.biz/api/v2/cmdb/firewall/policy"
    set xmlHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0")
    xmlHTTP.setOption 2, 13056 ' 証明書のエラーを無視する
    xmlHTTP.open "GET", strUri, false
    set xmlDoc = CreateObject("Msxml2.DOMDocument")
'    xmlHTTP.setRequestHeader "Cookie", "ccsrftoken_ " & strCcsrftokenKey & "=" & strCcsrftokenVal & "; path=/"
'    xmlHTTP.setRequestHeader "Cookie", "ccsrftoken_ " & strCcsrftokenKey & "=" & strCcsrftokenVal & "; path=/"
'    xmlHTTP.setRequestHeader "Cookie", "ccsrftoken=" & strCcsrftokenVal & "; path=/"
'    xmlHTTP.setRequestHeader "Cookie", "ccsrftoken=" & strCcsrftokenVal & "; path=/"

'xmlHTTP.setRequestHeader "Cookie", "APSCOOKIE_2368703245=""Era%3D0%26Payload%3DnMrUy%2Fu9ezjVW1tmkvxzboQlIsag%2F722mpRSI+rERksyd2qY+h3RDfoFn5vVodA2%0Aeq72FVCD4xxg9CjUwaO5QMp9QhGDkIVrg09KBLibqNIB+MTRdliwHVtbAnGQ6OZ7%0AC4D%2Faj4wbQR7H%2FIFjuCkjsckaa%2FTCauaJCu3oM3sJss6KPbd3oEoOw6Hc8OA1%2FwR%0AXP3NMmE5ktaAssLs6C33Jw%3D%3D%0A%26AuthHash%3Dg8qhaUAO62xLDJ24xonlPuKkLjwA%0A""; path=/; HttpOnly"
'xmlHTTP.setRequestHeader "Cookie", "ccsrftoken_2368703245=""FD905905C69871C3AF1BB341188C059""; path=/"
'xmlHTTP.setRequestHeader "Cookie", "ccsrftoken=""FD905905C69871C3AF1BB341188C059""; path=/"

xmlHTTP.setRequestHeader "Cookie", "APSCOOKIE_2368703245=""0%260""; path=/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "VDOM_2368703245=""0%260""; path=/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "log_filters=""0%260""; path=/log/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "log_type=""0%260""; path=/log/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "CENTRAL_MGMT_OVERRIDE_2368703245=""0%260""; path=/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "EDIT_HISTORY_2368703245=""20%260""; path=/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "FILE_DOWNLOADING_2368703245=""20%2602""; path=/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "csrftoken_2368703245=""20%2602""; path=/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "ccsrftoken_2368703245=""0%260""; path=/; expires=Sun, 01-Oct-1967 13:10:26 GMT"
xmlHTTP.setRequestHeader "Cookie", "ccsrftoken=""0%260""; path=/; expires=Sun, 01-Oct-1967 13:10:26 GMT"


    xmlHTTP.send()
    xmlDoc.async = false
    xmlDoc.loadXML(xmlHTTP.responseText)
    postDataOnHttp = xmlHTTP.responseText
''' msgbox(convBytes2SJIS(xmlHTTP.responseBody))
'msgbox(xmlHTTP.responseText)

  RESPONSE_TEXT = "C:\Users\junic\Desktop\forti\response_" & strNow & "_002.txt"
  Set oStream = CreateObject("ADODB.Stream")
  oStream.Open
  oStream.Type = 1
  oStream.Write xmlHTTP.responseBody
  oStream.SaveToFile RESPONSE_TEXT
  oStream.Close
  postDataOnHttp = xmlHTTP.responseText
  Set oStream = Nothing

    if xmlDoc.parseError.errorCode <> 0 Then
    else
        strXMLOUT = xmlDOC.XML
        Set xmlDoc = Nothing
        Set xmlHTTP = Nothing
    end if
End Function


Function putDataOnHttp(Byval strPutData ,ByVal strQuery)
    set xmlHTTP = CreateObject("Msxml2.XMLHTTP")
    set xmlDoc = CreateObject("Msxml2.DOMDocument")
    xmlHTTP.open "POST", strQuery, false
    xmlHTTP.setRequestHeader "Content-Type", "application/json"
    xmlHTTP.send(strPutData)
    xmlDoc.async = false
    xmlDoc.loadXML(xmlHTTP.responseText)
    putDataOnHttp = xmlHTTP.responseText
    if xmlDoc.parseError.errorCode <> 0 Then
    else
        strXMLOUT = xmlDOC.XML
        Set xmlDoc = Nothing
        Set xmlHTTP = Nothing
    end if
End Function


Function getDataOnHttp(ByVal strQuery)
'    set xmlHTTP = CreateObject("Msxml2.XMLHTTP")
    set xmlHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0")
    xmlHTTP.setOption 2, 13056 ' 証明書のエラーを無視する
    set xmlDoc = CreateObject("Msxml2.DOMDocument")
    xmlHTTP.open "GET", strQuery, false
    xmlHTTP.setRequestHeader "Content-Type", "application/json"
    xmlHTTP.send()
    xmlDoc.async = false
'    xmlDoc.loadXML(xmlHTTP.responseText)
    getDataOnHttp = xmlHTTP.responseText
    if xmlDoc.parseError.errorCode <> 0 Then
    else
        strXMLOUT = xmlDOC.XML
        Set xmlDoc = Nothing
        Set xmlHTTP = Nothing
    end if
End Function


Function pickupByRegExp(ByVal strTarget , Byval strRegExp , ByVal intMatch , ByVal strHead , ByVal strTail)
  Dim dicResult
  Set dicResult = CreateObject("Scripting.Dictionary")
  
  Dim intX,strReturn

  Dim regEx, Match, Matches
  Set regEx = New RegExp
  regEx.Pattern = strRegExp
  regEx.IgnoreCase = True
  regEx.Global = True
  Set Matches = regEx.Execute(strTarget)
  If Matches.Count <=0 Then Exit Function
  If Matches.Count < intMatch Then Exit Function

'  strRet = "◆◆◆ 正規表現で検索した結果、" & Matches.Count & " 件がマッチしました。" & vbCRLF
  intX = 0
  For Each Match in Matches
    intX = intX + 1
    dicResult.Add intX,CStr(Match.Value)
'      strRet = strRet & "一致する文字列は、"
'      strRet = strRet & Match.FirstIndex & " 文字目で見つかり、一致した文字列は、"
'      strRet = strRet & Match.Value & " で、文字列の長さは、 "
'      strRet = strRet & Match.Length & " でした。" & vbCRLF
  Next
  
  strReturn = dicResult.item(intMatch)
'  msgbox("マッチした文字列は、 " & strReturn & " でした。" & chr(13) & strRet)
  strReturn = Replace(strReturn,strHead,"")
  strReturn = Replace(strReturn,strTail,"")
  pickupByRegExp = strReturn
  Set regEx = Nothing
  Set dicResult = Nothing
End Function


Function convBytes2SJIS(bin)
  Set objStream = CreateObject("ADODB.Stream")
  objStream.Open
  objStream.Type = 1
  objStream.Write bin
  objStream.Position = 0
  objStream.Type = 2
  objStream.Charset = "Shift_JIS"
  convBytes2SJIS = objStream.ReadText
  objStream.Close
  Set objStream = Nothing
End Function


Function convBytes2UTF8(bin)
  Set objStream = CreateObject("ADODB.Stream")
  objStream.Open
  objStream.Type = 1
  objStream.Write bin
  objStream.Position = 0
  objStream.Type = 2
  objStream.Charset = "UTF-8"
  convBytes2UTF8 = objStream.ReadText
  objStream.Close
  Set objStream = Nothing
End Function


Function convBytes2Base64(bin)
  Set objElement = CreateObject("Msxml2.DOMDocument").createElement("base64")
  objElement.dataType = "bin.base64"
  objElement.nodeTypedValue = bin
  Bytes2Base64 = objElement.text
  Set objElement = Nothing
End Function

'curl処理が必要な場合の対応
'https://mysql.koganeitriathlon.biz/logincheck -d "username=admin&secretkey=PASSWORD" -v -k -D - -c cookie.txt
'https://mysql.koganeitriathlon.biz/logincheck -d "username=admin&secretkey=PASSWORD" -k -D - -c cookie.txt
'https://mysql.koganeitriathlon.biz/api/v2/cmdb/firewall/policy -v -b cookie.txt --insecure
'http://www.yunabe.jp/docs/cookie_and_security.html
