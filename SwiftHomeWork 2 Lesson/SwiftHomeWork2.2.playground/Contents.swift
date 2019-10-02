/*Выполнил: Маким Цалюк
 Группа: iOS 19-2
 Дата сдачи: 13.09.2019
 Номер задания: 2.2
 Текст задания:
 2.2. С сервера к нам приходит тюпл с тремя параметрами:
 statusCode, message, errorMessage (число, строка и строка)
 в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
 если statusCode от 200 до 300 исключительно, то выводите message,
 в противном случает выводите errorMessage
 После этого проделайте тоже самое только без участия statusCode
 
 (Примеры тюплов: (200, "ok", nil), (404, nil, "server not found") )
 Если входной тюпл: (statusCode : 200, message : "OK", errorMessage : "")
 
 На экран должно вывестись: Данные получены корректно. message: "ok"
 
 или входной тюпл: (statusCode: 404, message: nil, errorMessage: "server not found")
 На экран должно вывестись: Данные получены не корректно. statusCode: 404, errorMessage: "server not found"
 */


import UIKit

var server: (statusCode: Int, message: String?, errorMessage: String?)
server = (400, nil, "Error!")


    if (server.statusCode > 200 && server.statusCode < 300)
    {
        print("Status Code: \(server.statusCode) Message: \(server.message!)")
    }else
    {
        print("Status Code: \(server.statusCode) Error Message: \(server.errorMessage!)")
    }

print("\n")

if (server.message != nil)
{
    print("Message: \(server.message!)")
}else if (server.errorMessage != nil)
{
    print("Error Message: \(server.errorMessage!)")
}

