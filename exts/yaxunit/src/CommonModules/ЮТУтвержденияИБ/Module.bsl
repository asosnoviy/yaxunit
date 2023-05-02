//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2021-2023 BIA-Technologies Limited Liability Company
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//©///////////////////////////////////////////////////////////////////////////©//

#Область ПрограммныйИнтерфейс

Функция ЧтоТаблица(ИмяТаблицы, ОписаниеПроверки = "") Экспорт
	
	Контекст = НовыйКонтекст(ИмяТаблицы);
	Контекст.ПрефиксОшибки = ОписаниеПроверки;
	
	ЮТКонтекст.УстановитьЗначениеКонтекста(ИмяКонтекста(), Контекст);
	
	Возврат ЮТУтвержденияИБ;
	
КонецФункции

Функция СодержитЗаписи(Знач Предикат = Неопределено, Знач ОписаниеПроверки = Неопределено) Экспорт
	
	Контекст = Контекст();
	УстановитьОписаниеПроверки(Контекст, ОписаниеПроверки);
	ОписаниеЗапроса = ОписаниеЗапроса(Контекст, Предикат);
	Результат = ЮТЗапросы.РезультатНеПустой(ОписаниеЗапроса);
	
	Если Не Результат Тогда
		Контекст = Контекст();
		СгенерироватьОшибкуУтверждения(Контекст, Предикат, "содержит записи");
	КонецЕсли;

	Возврат ЮТУтвержденияИБ;
	
КонецФункции

Функция НеСодержитЗаписи(Знач Предикат = Неопределено, Знач ОписаниеПроверки = Неопределено) Экспорт
	
	Контекст = Контекст();
	УстановитьОписаниеПроверки(Контекст, ОписаниеПроверки);
	ОписаниеЗапроса = ОписаниеЗапроса(Контекст, Предикат);
	Результат = ЮТЗапросы.РезультатПустой(ОписаниеЗапроса);
	
	Если Не Результат Тогда
		Контекст = Контекст();
		СгенерироватьОшибкуУтверждения(Контекст, Предикат, "не содержит записи");
	КонецЕсли;
	
	Возврат ЮТУтвержденияИБ;
	
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область Контекст

// Контекст.
// 
// Возвращаемое значение:
//  см. НовыйКонтекст
Функция Контекст()
	
	//@skip-check constructor-function-return-section
	Возврат ЮТКонтекст.ЗначениеКонтекста(ИмяКонтекста());
	
КонецФункции

// Инициализирует контекст
// 
// Параметры:
//  ИмяТаблицы - Строка
//  
// Возвращаемое значение:
//  см. ЮТФабрика.ОписаниеПроверки
Функция НовыйКонтекст(ИмяТаблицы)
	
	Контекст = ЮТФабрика.ОписаниеПроверки(ИмяТаблицы);
	
	Возврат Контекст;
	
КонецФункции

Функция ИмяКонтекста()
	
	Возврат "КонтекстУтвержденияИБ";
	
КонецФункции

#КонецОбласти

Функция ОписаниеЗапроса(Контекст, ПредикатыУсловия, ВыбираемыеПоля = Неопределено)
	
	Описание = ЮТЗапросы.ОписаниеЗапроса();
	Описание.ИмяТаблицы = Контекст.ОбъектПроверки.Значение;
	Описание.ВыбираемыеПоля.Вставить("Проверка", "1");
	
	СформироватьУсловия(ПредикатыУсловия, Описание.Условия, Описание.ЗначенияПараметров);
	
	Возврат Описание;
	
КонецФункции

Процедура СформироватьУсловия(Предикат, КоллекцияУсловий, ЗначенияПараметров)
	
	Если Предикат = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Предикаты = ЮТПредикатыКлиентСервер.НаборПредикатов(Предикат);
	ВидыСравнения = ЮТПредикаты.Выражения();
	
	Для Каждого ВыражениеПредиката Из Предикаты Цикл
		
		ИмяПараметра = "Параметр_" + ЮТОбщий.ЧислоВСтроку(ЗначенияПараметров.Количество() + 1);
		Шаблон = ШаблонУсловия(ВыражениеПредиката.ВидСравнения, ВидыСравнения);
		
		Условие = СтрШаблон(Шаблон, ВыражениеПредиката.ИмяРеквизита, ИмяПараметра);
		
		КоллекцияУсловий.Добавить(Условие);
		ЗначенияПараметров.Вставить(ИмяПараметра, ВыражениеПредиката.Значение);
		
	КонецЦикла;
	
КонецПроцедуры

Функция ШаблонУсловия(Знач Выражение, ВыраженияПредикатов)
	
	Отрицание = ЮТПредикатыКлиентСервер.ЭтоВыраженияОтрицания(Выражение);
	Если Отрицание Тогда
		Выражение = ЮТПредикатыКлиентСервер.ВыраженияБезОтрицания(Выражение);
	КонецЕсли;
	
	Если Выражение = ВыраженияПредикатов.Равно Тогда
		Шаблон = "%1 = &%2";
	ИначеЕсли Выражение = ВыраженияПредикатов.Больше Тогда
		Шаблон = "%1 > &%2";
	ИначеЕсли Выражение = ВыраженияПредикатов.БольшеРавно Тогда
		Шаблон = "%1 >= &%2";
	ИначеЕсли Выражение = ВыраженияПредикатов.Меньше Тогда
		Шаблон = "%1 < &%2";
	ИначеЕсли Выражение = ВыраженияПредикатов.МеньшеРавно Тогда
		Шаблон = "%1 <= &%2";
	ИначеЕсли Выражение = ВыраженияПредикатов.ИмеетТип Тогда
		Шаблон = "ТИПЗНАЧЕНИЯ(%1) = &%2";
	ИначеЕсли Выражение = ВыраженияПредикатов.Содержит Тогда
		Шаблон = "%1 ПОДОБНО ""%%"" + &%2 + ""%%""";
	ИначеЕсли Выражение = ВыраженияПредикатов.Заполнено Тогда
		// TODO Реализовать
		ВызватьИсключение "Проверка заполненности пока не поддерживается";
	Иначе
		ВызватьИсключение "Неподдерживаемое выражения предикатов " + Выражение;
	КонецЕсли;
	
	Возврат Шаблон;
	
КонецФункции

Процедура СгенерироватьОшибкуУтверждения(Контекст, Предикат, Сообщение)
	
	Если Предикат <> Неопределено Тогда
		ПредставлениеПредиката = ЮТПредикатыКлиентСервер.ПредставлениеПредикатов(Предикат, ", ", "`%1`");
	КонецЕсли;
	
	Если ЗначениеЗаполнено(ПредставлениеПредиката) Тогда
		СообщениеОбОшибке = СтрШаблон("%1 с %2", Сообщение, ПредставлениеПредиката);
	Иначе
		СообщениеОбОшибке = Сообщение;
	КонецЕсли;
	
	ЮТРегистрацияОшибок.СгенерироватьОшибкуУтверждения(Контекст, СообщениеОбОшибке, Неопределено, "проверяемая таблица");
	
КонецПроцедуры

Процедура УстановитьОписаниеПроверки(Контекст, ОписаниеПроверки)
	
	Контекст.ОписаниеПроверки = ОписаниеПроверки;
	
КонецПроцедуры

#КонецОбласти
