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

#Область Инициализация

// Подписка на это событие позволяет:
// 
// * выполнить базовую настройку параметров запуска
// * эту настройку можно переопределить параметрами запуска (json файл с настройками)
// * может быть полезно при расширении возможностей движка новыми настраиваемыми механизмами
// * обработчик может (а точнее, должен) изменять `ПараметрыЗапуска`
// 
// Параметры:
//  ПараметрыЗапуска - см. ЮТФабрика.ПараметрыЗапуска
Процедура УстановитьПараметрыЗапускаПоУмолчанию(ПараметрыЗапуска) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ПараметрыЗапуска);
	ВызватьПодключаемыйОбработчикСобытия("УстановитьПараметрыЗапускаПоУмолчанию", "Инициализация", Параметры);
	
КонецПроцедуры

// Вызывается при первичной инициализации глобального контекста.
// Используется для первоначального заполнения контекста, параметра `ДанныеКонтекста`
// Вызывается и для сервера, и для клиента 
// 
// Параметры:
//  ДанныеКонтекста - Структура
Процедура ИнициализацияКонтекста(ДанныеКонтекста) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ДанныеКонтекста);
	ВызватьПодключаемыйОбработчикСобытия("ИнициализацияКонтекста", "Инициализация", Параметры);
	
КонецПроцедуры

// Вызывается после инициализации контекстов и загрузки настроек.
// Позволяет выполнить настройку различных механизмов движка.
// 
// Важно: В этом обработчике нельзя менять параметр `ПараметрыЗапуска`.
// 
// Параметры:
//  ПараметрыЗапуска - см. ЮТФабрика.ПараметрыЗапуска
Процедура Инициализация(ПараметрыЗапуска) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ПараметрыЗапуска);
	ВызватьПодключаемыйОбработчикСобытия("Инициализация", "Инициализация", Параметры);
	
КонецПроцедуры

// Вызывается при сборе информации об окружении на клиенте.
// Позволяет дополнить описание окружения своими данными
// 
// Параметры:
//  ОписаниеОкружения - см. ЮТФабрика.НовоеОписаниеОкружения
Процедура СборИнформацииОбОкружении(ОписаниеОкружения) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ОписаниеОкружения);
	ВызватьПодключаемыйОбработчикСобытия("СборИнформацииОбОкружении", "Инициализация", Параметры);
	
КонецПроцедуры

#КонецОбласти

#Область СобытияИсполненияТестов

// Обработчик события "ПередВсемиТестамиМодуля"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
Процедура ПередВсемиТестамиМодуля(ТестовыйМодуль) Экспорт
	
	УстановитьКонтекстИсполнения(ТестовыйМодуль);
	ЮТКонтекстСлужебный.УстановитьКонтекстМодуля();
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль);
	ВызватьОбработкуСобытияИсполненияТестов("ПередВсемиТестами", ОписаниеСобытия);
	
КонецПроцедуры

// Обработчик события "ПередТестовымНабором"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
//  Набор - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоНабораТестов
Процедура ПередТестовымНабором(ТестовыйМодуль, Набор) Экспорт
	
	УстановитьКонтекстИсполнения(ТестовыйМодуль, Набор);
	ЮТКонтекстСлужебный.УстановитьКонтекстНабораТестов();
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль, Набор);
	ВызватьОбработкуСобытияИсполненияТестов("ПередТестовымНабором", ОписаниеСобытия);
	
КонецПроцедуры

// Обработчик события "ПередКаждымТестом"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
//  Набор - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоНабораТестов
//  Тест - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТеста
Процедура ПередКаждымТестом(ТестовыйМодуль, Набор, Тест) Экспорт
	
	// Установка контекста исполнения вызывается в см. ЮТИсполнительСлужебныйКлиентСервер.ПередКаждымТестом
	ЮТКонтекстСлужебный.УстановитьКонтекстТеста();
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль, Набор, Тест);
	
	#Если Сервер ИЛИ ТолстыйКлиентОбычноеПриложение ИЛИ ТолстыйКлиентУправляемоеПриложение Тогда
	ПолучитьСообщенияПользователю(Истина);
	#КонецЕсли
	
	ВызватьОбработкуСобытийИсполненияТестов(ЮТКоллекции.ЗначениеВМассиве("ПередКаждымТестом", "ПередТестом"), ОписаниеСобытия);
	
КонецПроцедуры

// Обработчик события "ПослеКаждогоТеста"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
//  Набор - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоНабораТестов
//  Тест - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТеста
Процедура ПослеКаждогоТеста(ТестовыйМодуль, Набор, Тест) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль, Набор, Тест);
	
	ВызватьОбработкуСобытийИсполненияТестов(ЮТКоллекции.ЗначениеВМассиве("ПослеТеста", "ПослеКаждогоТеста"), ОписаниеСобытия);
	
	УстановитьКонтекстИсполнения(ТестовыйМодуль, Набор);
	
КонецПроцедуры

// Обработчик события "ПослеТестовогоНабора"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
//  Набор - см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоНабораТестов
Процедура ПослеТестовогоНабора(ТестовыйМодуль, Набор) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль, Набор);
	ВызватьОбработкуСобытияИсполненияТестов("ПослеТестовогоНабора", ОписаниеСобытия);
	
	УстановитьКонтекстИсполнения(ТестовыйМодуль);
	
КонецПроцедуры

// Обработчик события "ПослеВсехТестовМодуля"
//
// Параметры:
//  ТестовыйМодуль - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
Процедура ПослеВсехТестовМодуля(ТестовыйМодуль) Экспорт
	
	ОписаниеСобытия = ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов(ТестовыйМодуль);
	ВызватьОбработкуСобытияИсполненияТестов("ПослеВсехТестов", ОписаниеСобытия);
	
	УстановитьКонтекстИсполнения();
	
КонецПроцедуры

// Перед выполнением тестов.
//
// Параметры:
//  ИсполняемыеМодули - Массив из см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТестовогоМодуля
Процедура ПередВыполнениемТестов(ИсполняемыеМодули) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ИсполняемыеМодули);
	ВызватьПодключаемыйОбработчикСобытия("ПередВыполнениемТестов", "ИсполнениеТестов", Параметры);
	
КонецПроцедуры

// После выполнения тестов.
//
// Параметры:
//  РезультатТестирования - Массив из см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТестовогоМодуля
Процедура ПослеВыполненияТестов(РезультатТестирования) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(РезультатТестирования);
	ВызватьПодключаемыйОбработчикСобытия("ПослеВыполненияТестов", "ИсполнениеТестов", Параметры);
	
КонецПроцедуры

#КонецОбласти

#Область СобытияЗагрузкиТестов

// Обработка события "ПередЧтениеСценариев"
// Вызывается перед загрузкой тестов.
Процедура ПередЧтениеСценариев() Экспорт
	
	Параметры = Новый Массив();
	ВызватьПодключаемыйОбработчикСобытия("ПередЧтениеСценариев", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

// Обработчик события "ПередЧтениемСценариевМодуля"
//  Вызывается перед чтением сценариев конкретного модуля (вызовом метода `ИсполняемыеСценарии`).
//  Позволяет настроить базовые параметры перед чтением настроек тестов модуля.
//  
// Параметры:
//  МетаданныеМодуля - см. ЮТФабрикаСлужебный.ОписаниеМетаданныеМодуля
Процедура ПередЧтениемСценариевМодуля(МетаданныеМодуля) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(МетаданныеМодуля);
	ВызватьПодключаемыйОбработчикСобытия("ПередЧтениемСценариевМодуля", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

// После чтения сценариев модуля.
//  Позволяет настроить/обработать параметры загруженных настроек тестов модуля
// Параметры:
//  ОписаниеТестовогоМодуля - см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля
Процедура ПослеЧтенияСценариевМодуля(ОписаниеТестовогоМодуля) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ОписаниеТестовогоМодуля);
	ВызватьПодключаемыйОбработчикСобытия("ПослеЧтенияСценариевМодуля", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

// Обработка события "ПослеЧтенияСценариев"
// Параметры:
//  Сценарии - Массив из см. ЮТФабрикаСлужебный.ОписаниеТестовогоМодуля - Набор описаний тестовых модулей, которые содержат информацию о запускаемых тестах
Процедура ПослеЧтенияСценариев(Сценарии) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(Сценарии);
	ВызватьПодключаемыйОбработчикСобытия("ПослеЧтенияСценариев", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

// Обработка события "ПослеФормированияИсполняемыхНаборовТестов"
// Параметры:
//  ИсполняемыеТестовыеМодули - Массив из см. ЮТФабрикаСлужебный.ОписаниеИсполняемогоТестовогоМодуля - Набор исполняемых наборов
Процедура ПослеФормированияИсполняемыхНаборовТестов(ИсполняемыеТестовыеМодули) Экспорт
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ИсполняемыеТестовыеМодули);
	ВызватьПодключаемыйОбработчикСобытия("ПослеФормированияИсполняемыхНаборовТестов", "ЗагрузкаТестов", Параметры);
	
КонецПроцедуры

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура УстановитьКонтекстИсполнения(ТестовыйМодуль = Неопределено, Набор = Неопределено, Тест = Неопределено) Экспорт
	
	Уровни = ЮТФабрика.УровниИсполнения();
	КонтекстИсполнения = ЮТКонтекстСлужебный.КонтекстИсполнения();
	
	КонтекстИсполнения.Модуль = ТестовыйМодуль;
	КонтекстИсполнения.Набор = Набор;
	КонтекстИсполнения.Тест = Тест;
	
	Если Тест <> Неопределено Тогда
		КонтекстИсполнения.Уровень = Уровни.Тест;
	ИначеЕсли Набор <> Неопределено Тогда
		КонтекстИсполнения.Уровень = Уровни.НаборТестов;
	ИначеЕсли ТестовыйМодуль <> Неопределено Тогда
		КонтекстИсполнения.Уровень = Уровни.Модуль;
	Иначе
		КонтекстИсполнения.Уровень = Неопределено;
	КонецЕсли;
	
КонецПроцедуры

Процедура ВызватьОбработкуСобытийИсполненияТестов(События, ОписаниеСобытия)
	
	Для ы = 0 По События.ВГраница() Цикл
		
		ИмяСобытия = События[ы];
		ПропуститьОбработчикТестовогоМодуля = (ы > 0 И ОбработчикСобытияПереопределен(ИмяСобытия));
		
		Если ПропуститьОбработчикТестовогоМодуля Тогда
			Параметры = ЮТКоллекции.ЗначениеВМассиве(ОписаниеСобытия);
			Ошибки = ВызватьПодключаемыйОбработчикСобытия(ИмяСобытия, "ИсполнениеТестов", Параметры);
			ЗарегистрироватьОшибкиСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибки);
		Иначе
			ВызватьОбработкуСобытияИсполненияТестов(ИмяСобытия, ОписаниеСобытия);
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

Процедура ВызватьОбработкуСобытияИсполненияТестов(ИмяСобытия, ОписаниеСобытия)
	
	Параметры = ЮТКоллекции.ЗначениеВМассиве(ОписаниеСобытия);
	
	Если ЭтоСобытиеПеред(ИмяСобытия) Тогда
		Ошибки = ВызватьПодключаемыйОбработчикСобытия(ИмяСобытия, "ИсполнениеТестов", Параметры);
		ВызватьОбработчикТестовогоМодуля(ИмяСобытия, ОписаниеСобытия);
	Иначе
		ВызватьОбработчикТестовогоМодуля(ИмяСобытия, ОписаниеСобытия);
		Ошибки = ВызватьПодключаемыйОбработчикСобытия(ИмяСобытия, "ИсполнениеТестов", Параметры);
	КонецЕсли;
	
	ЗарегистрироватьОшибкиСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибки);
	
КонецПроцедуры

Функция ВызватьПодключаемыйОбработчикСобытия(ИмяСобытия, Подсистема, ПараметрыСобытия)
	
	Ошибки = Новый Массив();
	
	Для Каждого ИмяМодуля Из ЮТПодключаемыеМодулиСлужебный.ОбработчикиСобытий(Подсистема) Цикл
		
		Если ЮТМетодыСлужебный.МетодМодуляСуществует(ИмяМодуля, ИмяСобытия) Тогда
			ПолноеИмяМетода = СтрШаблон("%1.%2", ИмяМодуля, ИмяСобытия);
			
			ЮТЛогирование.Отладка(СтрШаблон("Обработка события `%1` - `%2`", ИмяСобытия, ПолноеИмяМетода));
			Ошибка = ЮТМетодыСлужебный.ВыполнитьМетод(ПолноеИмяМетода, ПараметрыСобытия);
			Если Ошибка <> Неопределено Тогда
				ЮТЛогирование.Ошибка(ЮТРегистрацияОшибок.ПредставлениеОшибки("Ошибка обработки события", Ошибка));
			КонецЕсли;
			
			Если Ошибка <> Неопределено Тогда
				Ошибки.Добавить(Ошибка);
			КонецЕсли;
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат Ошибки;
	
КонецФункции

// Вызвать обработчик модуля.
//
// Параметры:
//  ИмяСобытия - Строка - Имя вызываемого метода обработки события
//  ОписаниеСобытия - см. ЮТФабрикаСлужебный.ОписаниеСобытияИсполненияТестов
//
Процедура ВызватьОбработчикТестовогоМодуля(Знач ИмяСобытия, ОписаниеСобытия)
	
	ОбработчикСобытияПереопределен = ОбработчикСобытияПереопределен(ИмяСобытия);
	Если ОбработчикСобытияПереопределен Тогда
		ИмяСобытия = ПереопределенноеИмяСобытия(ИмяСобытия);
	КонецЕсли;
	
	ИмяМодуля = ОписаниеСобытия.Модуль.Метаданные.Имя;
	
	ЧастиКоманды = СтрРазделить(ИмяСобытия, ".");
	Если ЧастиКоманды.Количество() = 2 Тогда
		ИмяМодуля = ЧастиКоманды[0];
		ИмяСобытия = ЧастиКоманды[1];
	КонецЕсли;
	
	Ошибки = Новый Массив();
	Команда = СтрШаблон("%1.%2()", ИмяМодуля, ИмяСобытия);
	Если ЮТМетодыСлужебный.МетодМодуляСуществует(ИмяМодуля, ИмяСобытия) Тогда
		
		ЮТЛогирование.Отладка(СтрШаблон("Обработка события `%1` - `%2`", ИмяСобытия, Команда));
		Ошибка = ЮТМетодыСлужебный.ВыполнитьМетод(Команда);
		
		Если Ошибка <> Неопределено Тогда
			Ошибки.Добавить(Ошибка);
		КонецЕсли;
		
	ИначеЕсли ОбработчикСобытияПереопределен Тогда
		
		ТекстИсключения = СтрШаблон("Не найден обработчик тестового модуля %1", Команда);
		ВызватьИсключение ТекстИсключения;
		
	КонецЕсли;
	
	ЗарегистрироватьОшибкиСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибки);
	
КонецПроцедуры

Процедура ЗарегистрироватьОшибкиСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибки)
	
	Для Каждого Ошибка Из Ошибки Цикл
		ЮТРегистрацияОшибокСлужебный.ЗарегистрироватьОшибкуСобытияИсполнения(ИмяСобытия, ОписаниеСобытия, Ошибка);
	КонецЦикла;
	
КонецПроцедуры

Функция ОбработчикСобытияПереопределен(ИмяСобытия)
	
	Возврат ЗначениеЗаполнено(ПереопределенноеИмяСобытия(ИмяСобытия));
	
КонецФункции

Функция ПереопределенноеИмяСобытия(ИмяСобытия)
	
	Если ЭтоСобытиеПеред(ИмяСобытия) Тогда
		Возврат ЮТНастройкиВыполнения.Перед();
	ИначеЕсли ЭтоСобытиеПосле(ИмяСобытия) Тогда
		Возврат ЮТНастройкиВыполнения.После();
	Иначе
		Возврат "";
	КонецЕсли;
	
КонецФункции

Функция ЭтоСобытиеПеред(ИмяСобытия)
	
	Возврат СтрНачинаетсяС(ИмяСобытия, "Перед");
	
КонецФункции

Функция ЭтоСобытиеПосле(ИмяСобытия)
	
	Возврат СтрНачинаетсяС(ИмяСобытия, "После");
	
КонецФункции

#КонецОбласти
