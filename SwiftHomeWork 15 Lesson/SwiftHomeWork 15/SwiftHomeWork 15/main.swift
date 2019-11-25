/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    23.11.2019
 Номер задания: 14
 Текст задания:
 14 - ДЗ ARC (Automatic Reference Count)
 Доделать задание 14 так, чтобы методы, которые обращаются к членам семьи, были продублированы в lazy closures.
 
 например:
 class Mom {
 //из 14 задания
 var husband: Father?
 func husbandBuyBoots() {...}
 
 
 lazy var husbandBuyBoots: ()->() =  {[weak husband] ...}
 
 }
 */

import Foundation

var family: Family! = Family(mother: Mother(name: "Carol"), father: Father(name: "Josh"), children: [Child(name: "Anna"), Child(name: "Stan")])
family.mother.childrenGoToSleep()
family.mother.husbandBuyBoots()
family.father.childrenGoToSleep()
family.father.wifeCookMeat()
family.children[1].letsPlayFootbal()
family.children[0].momCookMeat()
family = nil
