/*Выполнил:    Максим Цалюк
 Группа:    iOS 19-2
 Дата сдачи:    23.11.2019
 Номер задания: 14
 Текст задания:
 14 - ДЗ ARC (Automatic Reference Count)
 Теория: https://swiftbook.ru/content/languageguide/automatic-reference-counting/
 Создать класс Family (семья), который содержит ссылки на маму, папу, массив детей.
 В семье создать маму, папу, 2 детей (сильными ссылками). У каждого человека должно быть имя.
 У класса мама:
 1) создать метод childrenGoToSleep(), который вызывает метод goToSleep() у каждого ребенка;
 2) создать метод husbandBuyBoots(), который вызывает метод buyBoots() у папы;
 У класса папа:
 1) создать метод childrenGoToSleep(), который вызывает метод goToSleep() у каждого ребенка;
 2) создать метод wifeCookMeat(), который вызывает метод cookMeat() у мамы;
 У класса ребенок:
 1) создать метод letsPlayFootbal(), который вызывает метод playFootbal() у каждого ребенка;
 2) создать метод momCookMeat(), который вызывает метод cookMeat() у мамы;
 Создать семью  (экземпляр класса Family)
 Вызвать все эти методы для демонстрации.
 Для каждого класса создать счетчик живых объектов и выводить на экран количество живых экземпляров в init и deinit.
 После демонстрации удалить экземпляр семья.
 После удаления семьи не должно остаться ни одного живого объекта.
 */

import Foundation

var family: Family? = Family(mother: Mother(name: "Carol"), father: Father(name: "Josh"), children: [Child(name: "Anna"), Child(name: "Stan")])
family!.mother.childrenGoToSleep()
family!.mother.husbandBuyBoots()
family!.father.childrenGoToSleep()
family!.father.wifeCookMeat()
family!.children[1].letsPlayFootbal()
family!.children[0].momCookMeat()
family = nil
