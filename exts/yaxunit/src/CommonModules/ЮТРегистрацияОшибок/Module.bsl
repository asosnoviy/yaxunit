//©///////////////////////////////////////////////////////////////////////////©//
//
//  Copyright 2021-2024 BIA-Technologies Limited Liability Company
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

#Область СлужебныйПрограммныйИнтерфейс

#Область ФиксацияОшибокВРезультате

// Регистрирует ошибку обработки события исполнения тестов
// 
// Параметры:
//  ИмяСобытия - Строка
//  ОписаниеСобытия - см. ЮТФабрика.ОписаниеСобытияИсполненияТестов
//  Ошибка - ИнформацияОбОшибке
//         - Строка
Процедура ЗарегистрироватьОшибкуСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибка) Экспорт
	
	ТипОшибки = ЮТФабрика.ТипыОшибок().ОшибкаОбработкиСобытия;
	Пояснение = ЮТСообщенияСлужебный.СообщениеОбОшибкеСобытия(ИмяСобытия, Ошибка);
	ДанныеОшибки = ДанныеОшибки(Ошибка, Пояснение, ТипОшибки);
	
	Если ОписаниеСобытия.Тест <> Неопределено Тогда
		Объект = ОписаниеСобытия.Тест;
	ИначеЕсли ОписаниеСобытия.Набор <> Неопределено Тогда
		Объект = ОписаниеСобытия.Набор;
	Иначе
		Объект = ОписаниеСобытия.Модуль;
	КонецЕсли;
	
	Объект.Ошибки.Добавить(ДанныеОшибки);
	
КонецПроцедуры

// Регистрирует ошибку загрузки тестов
// 
// Параметры:
//  Объект - Структура - см. ЮТФабрика.ОписаниеТестовогоМодуля или см. ЮТФабрика.ОписаниеТестовогоНабора или см. ЮТФабрика.ОписаниеТеста
//  Описание - Строка - Описания ошибки, места возникновения
//  Ошибка - ИнформацияОбОшибке
Процедура ЗарегистрироватьОшибкуЧтенияТестов(Объект, Описание, Ошибка) Экспорт
	
	ДанныеОшибки = ДанныеОшибки(Ошибка, Описание, ЮТФабрика.ТипыОшибок().ЧтенияТестов);
	Объект.Ошибки.Добавить(ДанныеОшибки);
	
КонецПроцедуры

// Регистрирует ошибку выполнения теста
// Параметры:
//  Тест - см. ЮТФабрика.ОписаниеИсполняемогоТеста
//  Ошибка - ИнформацияОбОшибке
Процедура ЗарегистрироватьОшибкуВыполненияТеста(Тест, Ошибка) Экспорт
	
	ТипОшибки = ТипОшибки(Ошибка, Тест.ПолноеИмяМетода);
	
	Если ТипОшибки = ЮТФабрика.ТипыОшибок().Утверждений Тогда
		ДанныеОшибки = ДанныеОшибкиУтверждений(Ошибка);
	ИначеЕсли ТипОшибки = ЮТФабрика.ТипыОшибок().Пропущен Тогда
		ДанныеОшибки = ДанныеОшибкиПропуска(Ошибка);
	Иначе
		ДанныеОшибки = ДанныеОшибки(Ошибка, ЮТСообщенияСлужебный.КраткоеСообщениеОшибки(Ошибка), ТипОшибки);
	КонецЕсли;
	
	Тест.Ошибки.Добавить(ДанныеОшибки);
	
КонецПроцедуры

// Регистрирует ошибку выполнения теста
// Параметры:
//  Объект - см. ЮТФабрика.ОписаниеИсполняемогоТеста
//  Сообщение - Строка
Процедура ЗарегистрироватьПростуюОшибкуВыполнения(Объект, Сообщение) Экспорт
	
	ДанныеОшибки = ДанныеОшибки(Неопределено, Сообщение, ЮТФабрика.ТипыОшибок().Исполнения);
	Объект.Ошибки.Добавить(ДанныеОшибки);
	
КонецПроцедуры

// Регистрирует ошибку режима выполнения теста
// Параметры:
//  Объект - см. ЮТФабрика.ОписаниеИсполняемогоТеста
//  Ошибка - Строка
Процедура ЗарегистрироватьОшибкуРежимаВыполнения(Объект, Ошибка) Экспорт
	
	ДанныеОшибки = ДанныеОшибки(Неопределено, Ошибка, ЮТФабрика.ТипыОшибок().НекорректныйКонтекстИсполнения);
	Объект.Ошибки.Добавить(ДанныеОшибки);
	
КонецПроцедуры

#КонецОбласти

// Вызывает ошибку выполнения теста, на основании перехваченной ошибки
// 
// Параметры:
//  ИнформацияОбОшибке - ИнформацияОбОшибке
//  ОписаниеПроверки - см. ЮТФабрика.ОписаниеПроверки
Процедура СгенерироватьОшибкуВыполнения(ИнформацияОбОшибке, ОписаниеПроверки = Неопределено) Экспорт
	
	СтруктураОшибки = ЮТКонтекст.КонтекстОшибки();
	СтруктураОшибки.ОшибкаУтверждения = Ложь;
	
	ВызватьОшибкуИсполнения(ИнформацияОбОшибке, ОписаниеПроверки);
	
КонецПроцедуры

// Вызывает ошибку сравнения значений
// При этом сохраняет в контекст состояние, для дальнейшей обработки
// 
// Параметры:
//  ОписаниеПроверки - см. ЮТФабрика.ОписаниеПроверки
//  Сообщение - Строка
//  ПроверяемоеЗначение - Произвольный
//  ОжидаемоеЗначение - Произвольный
//  ОбъектПроверки - Строка - Человекочитаемое описание проверяемого значения
Процедура СгенерироватьОшибкуСравнения(ОписаниеПроверки,
									   Сообщение,
									   ПроверяемоеЗначение,
									   ОжидаемоеЗначение,
									   ОбъектПроверки = "проверяемое значение") Экспорт
	
	УстановитьДанныеОшибкиСравнения(ПроверяемоеЗначение, ОжидаемоеЗначение);
	ТекстСообщения = ЮТСообщенияСлужебный.ФорматированныйТекстОшибкиУтверждения(ОписаниеПроверки, Сообщение, ОбъектПроверки);
	ВызватьОшибкуПроверки(ТекстСообщения, ОписаниеПроверки);
	
КонецПроцедуры

// Вызывает ошибку проверки утверждений
// При этом сохраняет в контекст состояние, для дальнейшей обработки
// 
// Параметры:
//  ОписаниеПроверки - см. ЮТФабрика.ОписаниеПроверки
//  Сообщение - Строка
//  ПроверяемоеЗначение - Произвольный
//  ОбъектПроверки - Строка - Человекочитаемое описание проверяемого значения
Процедура СгенерироватьОшибкуУтверждения(ОписаниеПроверки, Сообщение, ПроверяемоеЗначение, ОбъектПроверки = "проверяемое значение") Экспорт
	
	УстановитьДанныеОшибкиУтверждения(ПроверяемоеЗначение);
	ТекстСообщения = ЮТСообщенияСлужебный.ФорматированныйТекстОшибкиУтверждения(ОписаниеПроверки, Сообщение, ОбъектПроверки);
	ВызватьОшибкуПроверки(ТекстСообщения, ОписаниеПроверки);
	
КонецПроцедуры

Процедура Пропустить(Сообщение) Экспорт
	
	СтруктураОшибки = ЮТКонтекст.КонтекстОшибки();
	СтруктураОшибки.ОшибкаУтверждения = Ложь;
	
	СообщениеОбОшибке = СообщениеОбОшибке(Сообщение, ПрефиксОшибкиПропуска());
	ВызватьИсключение СообщениеОбОшибке;
	
КонецПроцедуры

Функция ПредставлениеОшибки(Знач Описание, Знач Ошибка) Экспорт
	
	Если ТипЗнч(Ошибка) = Тип("ИнформацияОбОшибке") Тогда
		Ошибка = Символы.ПС + ПодробноеПредставлениеОшибки(Ошибка);
	КонецЕсли;
	
	Возврат СтрШаблон("%1: %2", Описание, Ошибка);
	
КонецФункции

// Вызывает ошибку выполнения теста
// Служебный метод, предварительно нужно самостоятельно настроить контекст (см. ЮТКонтекст.КонтекстОшибки)
// Параметры:
//  ТекстСообщения - Строка
//  ОписаниеПроверки - см. ЮТФабрика.ОписаниеПроверки
Процедура ВызватьОшибкуПроверки(Знач ТекстСообщения, ОписаниеПроверки = Неопределено) Экспорт
	
	СообщениеОбОшибке = СообщениеОбОшибке(ТекстСообщения, ПрефиксОшибкиУтверждений(), ОписаниеПроверки);
	ВызватьИсключение СообщениеОбОшибке;
	
КонецПроцедуры

Процедура ЗарегистрироватьОшибкуИнициализацииДвижка(Ошибка, Описание) Экспорт
	
	СообщитьОбОшибке(Ошибка, Описание);
	
КонецПроцедуры

// Возвращает тип ошибки
// 
// Параметры:
//  Ошибка - ИнформацияОбОшибке
//  ИмяВызываемогоМетода - Строка - Имя вызываемого метода
// 
// Возвращаемое значение:
//  Строка - см. ЮТФабрика.ТипыОшибок
Функция ТипОшибки(Ошибка, ИмяВызываемогоМетода) Экспорт
	
	ТипыОшибок = ЮТФабрика.ТипыОшибок();
	
	Описание = Ошибка.Описание;
	
	ИмяМетода = Сред(ИмяВызываемогоМетода, СтрНайти(ИмяВызываемогоМетода, ".") + 1);
	
	Тексты = ТекстыОшибокВызоваМетода(ИмяМетода);
	
	Если Описание = Тексты.МетодНеОбнаружен
		И СтрНачинаетсяС(Ошибка.ИсходнаяСтрока, ИмяВызываемогоМетода) Тогда
		
		ТипОшибки = ТипыОшибок.ТестНеРеализован;
		
	ИначеЕсли Описание = Тексты.МалоПараметров И СтрНачинаетсяС(Ошибка.ИсходнаяСтрока, ИмяВызываемогоМетода) Тогда
		
		ТипОшибки = ТипыОшибок.МалоПараметров;
		
	ИначеЕсли Описание = Тексты.МногоПараметров И СтрНачинаетсяС(Ошибка.ИсходнаяСтрока, ИмяВызываемогоМетода) Тогда
		
		ТипОшибки = ТипыОшибок.МногоПараметров;
		
	ИначеЕсли СтрНачинаетсяС(Описание, ПрефиксОшибкиУтверждений()) Тогда
		
		ТипОшибки = ТипыОшибок.Утверждений;
		
	ИначеЕсли СтрНачинаетсяС(Описание, ПрефиксОшибкиПропуска()) Тогда
		
		ТипОшибки = ТипыОшибок.Пропущен;
		
	Иначе
		
		ТипОшибки = ТипыОшибок.Исполнения;
		
	КонецЕсли;
	
	Возврат ТипОшибки;
	
КонецФункции

Функция ПрефиксОшибкиУтверждений() Экспорт
	
	Возврат "[Failed]";
	
КонецФункции

Функция ПрефиксОшибкиВыполнения() Экспорт
	
	Возврат "[Broken]";
	
КонецФункции

Функция ПрефиксОшибкиПропуска() Экспорт
	
	Возврат "[Skip]";
	
КонецФункции

Функция СтатусВыполненияТеста(Тест) Экспорт
	
	СтатусыИсполненияТеста = ЮТФабрика.СтатусыИсполненияТеста();
	
	Если Тест.Ошибки.КОличество() = 0 Тогда
		Возврат СтатусыИсполненияТеста.Успешно;
	КонецЕсли;
	
	ПорядокСтатусов = Новый Массив();
	ПорядокСтатусов.Добавить(СтатусыИсполненияТеста.Успешно);
	ПорядокСтатусов.Добавить(СтатусыИсполненияТеста.Исполнение);
	ПорядокСтатусов.Добавить(СтатусыИсполненияТеста.НеРеализован);
	ПорядокСтатусов.Добавить(СтатусыИсполненияТеста.Ожидание);
	ПорядокСтатусов.Добавить(СтатусыИсполненияТеста.Пропущен);
	ПорядокСтатусов.Добавить(СтатусыИсполненияТеста.Ошибка);
	ПорядокСтатусов.Добавить(СтатусыИсполненияТеста.Сломан);
	
	Статус = Тест.Статус;
	
	Для Каждого Ошибка Из Тест.Ошибки Цикл
		
		СтатусОшибки = СтатусОшибки(Ошибка.ТипОшибки);
		
		Если ПорядокСтатусов.Найти(СтатусОшибки) > ПорядокСтатусов.Найти(Статус) Тогда
			Статус = СтатусОшибки;
		КонецЕсли;
		
		Если Статус = СтатусыИсполненияТеста.Сломан Тогда
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Статус;
	
КонецФункции

Функция СтатусОшибки(ТипОшибки) Экспорт
	
	СтатусОшибки = ЮТФабрика.ПараметрыТиповОшибок()[ТипОшибки].Статус;
	
	Если СтатусОшибки = Неопределено Тогда
		СтатусОшибки = ЮТФабрика.СтатусыИсполненияТеста().Сломан;
	КонецЕсли;
	
	Возврат СтатусОшибки;
	
КонецФункции

Процедура УстановитьДанныеОшибкиСравнения(ПроверяемоеЗначение, ОжидаемоеЗначение) Экспорт
	
	СтруктураОшибки = ЮТКонтекст.КонтекстОшибки();
	
	СтруктураОшибки.ОшибкаУтверждения   = Истина;
	СтруктураОшибки.ПроверяемоеЗначение = ЮТОбщий.ПредставлениеЗначения(ПроверяемоеЗначение);
	СтруктураОшибки.ОжидаемоеЗначение   = ЮТОбщий.ПредставлениеЗначения(ОжидаемоеЗначение);
	
КонецПроцедуры

Процедура УстановитьДанныеОшибкиУтверждения(ПроверяемоеЗначение) Экспорт
	
	СтруктураОшибки = ЮТКонтекст.КонтекстОшибки();
	
	СтруктураОшибки.ОшибкаУтверждения   = Истина;
	СтруктураОшибки.ПроверяемоеЗначение = ЮТОбщий.ПредставлениеЗначения(ПроверяемоеЗначение);
	СтруктураОшибки.ОжидаемоеЗначение   = Неопределено;
	
КонецПроцедуры

Функция ДобавитьОписания(ТекстОшибки, ОписаниеПроверки = Неопределено) Экспорт
	
	Если ОписаниеПроверки <> Неопределено Тогда
		ПрефиксОшибки = ЮТОбщий.ДобавитьСтроку(ОписаниеПроверки.ПрефиксОшибки, ОписаниеПроверки.ОписаниеПроверки, " ");
		СообщениеОбОшибке = ЮТОбщий.ДобавитьСтроку(ПрефиксОшибки, ТекстОшибки, ": ");
	Иначе
		СообщениеОбОшибке = ТекстОшибки;
	КонецЕсли;
	
	СообщениеОбОшибке = ВРег(Лев(СообщениеОбОшибке, 1)) + Сред(СообщениеОбОшибке, 2);
	Возврат СообщениеОбОшибке;
	
КонецФункции

Процедура ДобавитьОшибкуКРезультатуПроверки(РезультатПроверки, Знач Ошибка, ОписаниеПроверки = Неопределено) Экспорт
	
	Если ТипЗнч(Ошибка) = Тип("ИнформацияОбОшибке") Тогда
		Ошибка = ПодробноеПредставлениеОшибки(Ошибка);
	КонецЕсли;
	
	ТекстОшибки = ДобавитьОписания(Ошибка, ОписаниеПроверки);
	РезультатПроверки.Успешно = Ложь;
	РезультатПроверки.Сообщения.Добавить(ТекстОшибки);
	
КонецПроцедуры

Процедура ДобавитьОшибкуСравненияКРезультатуПроверки(РезультатПроверки, Сообщение, ПроверяемоеЗначение, ОжидаемоеЗначение) Экспорт
	
	ОписаниеКонтекстаОшибки = ЮТФабрика.ОписаниеКонтекстаОшибки();
	ОписаниеКонтекстаОшибки.ПроверяемоеЗначение = ПроверяемоеЗначение;
	ОписаниеКонтекстаОшибки.ОжидаемоеЗначение = ОжидаемоеЗначение;
	ОписаниеКонтекстаОшибки.ОшибкаУтверждения = Истина;
	ОписаниеКонтекстаОшибки.Сообщение = Сообщение;
	
	РезультатПроверки.Успешно = Ложь;
	РезультатПроверки.Сообщения.Добавить(ОписаниеКонтекстаОшибки);
	
КонецПроцедуры

Процедура ДобавитьПояснениеОшибки(Пояснение) Экспорт
	
	Детали = ЮТКонтекст.КонтекстДеталиОшибки();
	Установить = Детали = Неопределено;
	
	Если Установить Тогда
		Детали = Новый Массив();
	КонецЕсли;
	
	Детали.Добавить(Пояснение);
	
	Если Установить Тогда
		ЮТКонтекст.УстановитьКонтекстДеталиОшибки(Детали);
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область КонструкторыОписанийОшибки

Функция ДанныеОшибки(Ошибка, Знач Сообщение, ТипОшибки)
	
#Если Сервер Тогда
	Детали = ЮТКонтекст.КонтекстДеталиОшибки(Истина);
#Иначе
	ДеталиСервер = ЮТКонтекст.КонтекстДеталиОшибки(Истина);
	ДеталиКлиент = ЮТКонтекст.КонтекстДеталиОшибки();
	
	Если ЗначениеЗаполнено(ДеталиКлиент) И ЗначениеЗаполнено(ДеталиСервер) Тогда
		ЮТКоллекции.ДополнитьМассив(ДеталиСервер, ДеталиКлиент);
		Детали = ДеталиСервер;
	ИначеЕсли ЗначениеЗаполнено(ДеталиКлиент) Тогда
		Детали = ДеталиКлиент;
	ИначеЕсли ЗначениеЗаполнено(ДеталиСервер) Тогда
		Детали = ДеталиСервер;
	Иначе
		Детали = Неопределено;
	КонецЕсли;
#КонецЕсли
	
	Если ЗначениеЗаполнено(Детали) Тогда
		ЮТКонтекст.УстановитьКонтекстДеталиОшибки(Новый Массив());
		
		Детали.Добавить(Сообщение);
		Сообщение = СтрСоединить(Детали, Символы.ПС);
	КонецЕсли;
	
	ДанныеОшибки = ЮТФабрика.ОписаниеВозникшейОшибки(ТипОшибки + ": " + Сообщение);
	
	Если Ошибка <> Неопределено Тогда
		ДанныеОшибки.Стек = СтекОшибки(Ошибка);
	КонецЕсли;
	ДанныеОшибки.ТипОшибки = ТипОшибки;
	ДобавитьСообщенияПользователю(ДанныеОшибки);
	
	Возврат ДанныеОшибки;
	
КонецФункции

Функция СтекОшибки(Ошибка)
	
	Если ТипЗнч(Ошибка) = Тип("ИнформацияОбОшибке") Тогда
		Возврат ПодробноеПредставлениеОшибки(Ошибка);
	Иначе
		Возврат Неопределено;
	КонецЕсли;
	
КонецФункции

Функция ДанныеОшибкиУтверждений(Ошибка)
	
	Описание = ИзвлечьТекстОшибки(Ошибка, ПрефиксОшибкиУтверждений());
	
	ДанныеОшибки = ЮТФабрика.ОписаниеОшибкиСравнения(Описание);
	
	ДанныеОшибки.Стек = СтекОшибки(Ошибка);
	ДобавитьСообщенияПользователю(ДанныеОшибки);
	
	СтруктураОшибки = ЮТКонтекст.КонтекстОшибки();
	
	Если СтруктураОшибки <> Неопределено И СтруктураОшибки.ОшибкаУтверждения Тогда
		ДанныеОшибки.ПроверяемоеЗначение = СтруктураОшибки.ПроверяемоеЗначение;
		ДанныеОшибки.ОжидаемоеЗначение = СтруктураОшибки.ОжидаемоеЗначение;
	КонецЕсли;
	
	Возврат ДанныеОшибки;
	
КонецФункции

Функция ДанныеОшибкиПропуска(Ошибка)
	
	Описание = ИзвлечьТекстОшибки(Ошибка, ПрефиксОшибкиПропуска());
	
	ДанныеОшибки = ЮТФабрика.ОписаниеОшибкиПропуска(Описание);
	
	Возврат ДанныеОшибки;
	
КонецФункции

Функция ИзвлечьТекстОшибки(Ошибка, Префикс)
	
	ДлинаПрефикса = СтрДлина(Префикс);
	
	Описание = Сред(Ошибка.Описание, ДлинаПрефикса + 1);
	Описание = СокрЛП(Описание);
	
	Если СтрНачинаетсяС(Описание, "<") И СтрЗаканчиваетсяНа(Описание, ">") Тогда
		Описание = Сред(Описание, 2, СтрДлина(Описание) - 2);
	КонецЕсли;
	
	Возврат Описание;
	
КонецФункции

#КонецОбласти

Функция МодулиУтверждений()
	
	Возврат ЮТОбщий.ЗначениеВМассиве("ЮТУтверждения");
	
КонецФункции

Процедура СообщитьОбОшибке(Ошибка, Описание)
	
	ЮТОбщий.СообщитьПользователю(ПредставлениеОшибки(Описание, Ошибка));
	
КонецПроцедуры

Функция ИнформациюОбОшибкеВСтроку(Ошибка, НомерПричины = 0)
	
	ТекстОшибки = "";
	
	Если Ошибка = Неопределено Тогда
			
		ТекстОшибки = "Неизвестная ошибка.";
		
	ИначеЕсли ТипЗнч(Ошибка) = Тип("Строка") Тогда
			
		ТекстОшибки = Ошибка;
		
	ИначеЕсли ЭтоОшибкаСлужебногоМодуля(Ошибка) Тогда
		
		Если Ошибка.Причина = Неопределено Тогда
			
			ТекстОшибки = Ошибка.Описание;
			
		Иначе
			
			ТекстОшибки = ИнформациюОбОшибкеВСтроку(Ошибка.Причина, НомерПричины);
			
		КонецЕсли;
		
	Иначе
		
		Если Не ПустаяСтрока(Ошибка.ИмяМодуля) Тогда
			
			ТекстОшибки = ТекстОшибки + "{"
				+ Ошибка.ИмяМодуля + "("
				+ Ошибка.НомерСтроки + ")}: ";
				
		КонецЕсли;
		
		ТекстОшибки = ТекстОшибки + Ошибка.Описание + ?(ПустаяСтрока(Ошибка.ИсходнаяСтрока), "", "
						|" + Ошибка.ИсходнаяСтрока);
		
		Если Ошибка.Причина <> Неопределено Тогда
							
			ТекстОшибки = ТекстОшибки + "
				|
				|ПРИЧИНА №" + Формат(НомерПричины + 1, "ЧГ=0") + "
				|" + ИнформациюОбОшибкеВСтроку(Ошибка.Причина, НомерПричины + 1);
				
		КонецЕсли;
		
	КонецЕсли;
		
	Возврат ТекстОшибки;
	
КонецФункции

Функция ЭтоОшибкаСлужебногоМодуля(Ошибка)
	
	Если НЕ ЗначениеЗаполнено(Ошибка.ИмяМодуля) Тогда
		Возврат Ложь;
	КонецЕсли;
	
	Для Каждого ИмяМодуля Из МодулиУтверждений() Цикл
		Если СтрНайти(Ошибка.ИмяМодуля, ИмяМодуля) > 0 Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;
	
	Возврат Ложь;
	
КонецФункции

Процедура ДобавитьСообщенияПользователю(ДанныеОшибки)
	
#Если Сервер ИЛИ ТолстыйКлиентОбычноеПриложение ИЛИ ТолстыйКлиентУправляемоеПриложение Тогда
	Сообщения = ЮТОбщий.ВыгрузитьЗначения(ПолучитьСообщенияПользователю(Истина), "Текст");
	Если Сообщения.Количество() Тогда
		ДанныеОшибки.Стек = СтрШаблон("%1
			|Сообщения пользователю:
			|	%2", ДанныеОшибки.Стек, СтрСоединить(Сообщения, Символы.ПС));
	КонецЕсли;
#КонецЕсли

КонецПроцедуры

Процедура ВызватьОшибкуИсполнения(Знач ИнформацияОбОшибке, ОписаниеПроверки)
	
	ТекстОшибки = ИнформациюОбОшибкеВСтроку(ИнформацияОбОшибке);
	СообщениеОбОшибке = СообщениеОбОшибке(ТекстОшибки, ПрефиксОшибкиВыполнения(), ОписаниеПроверки);
	ВызватьИсключение СообщениеОбОшибке;
	
КонецПроцедуры

Функция СообщениеОбОшибке(ТекстОшибки, ПрефиксТипаОшибки, ОписаниеПроверки = Неопределено) Экспорт
	
	СообщениеОбОшибке = ДобавитьОписания(ТекстОшибки, ОписаниеПроверки);
	
	Возврат СтрШаблон("%1 <%2>", ПрефиксТипаОшибки, СообщениеОбОшибке);
	
КонецФункции

Функция ТекстыОшибокВызоваМетода(ИмяМетода)
	
	Тексты = Новый Структура("МетодНеОбнаружен, МногоПараметров, МалоПараметров");
	
	Если ЮТЛокальСлужебный.ЭтоАнглийскаяЛокальПлатформы() Тогда
		Тексты.МетодНеОбнаружен = СтрШаблон("Object method not found (%1)", ИмяМетода);
		Тексты.МногоПараметров = "Too many actual parameters";
		Тексты.МалоПараметров = "Not enough actual parameters";
	Иначе
		Тексты.МетодНеОбнаружен = СтрШаблон("Метод объекта не обнаружен (%1)", ИмяМетода);
		Тексты.МногоПараметров = "Слишком много фактических параметров";
		Тексты.МалоПараметров = "Недостаточно фактических параметров";
	КонецЕсли;
	
	Возврат Тексты;
	
КонецФункции

#КонецОбласти
