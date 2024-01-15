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

#Область ОписаниеПеременных

&НаКлиенте
Перем ИсполняемыеТестовыеМодули;

&НаКлиенте
Перем ПараметрыЗапускаТестирования;

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("АдресХранилища") И ЭтоАдресВременногоХранилища(Параметры.АдресХранилища) Тогда
		АдресОтчета = Параметры.АдресХранилища;
	КонецЕсли;
	
	Параметры.Свойство("ЗагрузитьТесты", ЗагрузитьТестыПриОткрытии);
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	Если ЗначениеЗаполнено(АдресОтчета) Тогда
		ДанныеОтчета = ДанныеОтчета(АдресОтчета);
		ПослеЗагрузкиТестов(ДанныеОтчета.РезультатыТестирования, ДанныеОтчета.ПараметрыЗапуска);
	ИначеЕсли ЗагрузитьТестыПриОткрытии Тогда
		ЗагрузитьТесты();
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыДеревоТестов

&НаКлиенте
Процедура ДеревоТестовПриАктивизацииСтроки(Элемент)
	
	Данные = Элементы.ДеревоТестов.ТекущиеДанные;
	
	Если Данные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если Данные.Ошибки.Количество() Тогда
		Элементы.ДеревоТестовОшибки.ТекущаяСтрока = Данные.Ошибки[0].ПолучитьИдентификатор();
	КонецЕсли;
	
	ОбновитьДоступностьСравнения();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыДеревоТестовОшибки

&НаКлиенте
Процедура ДеревоТестовОшибкиПриАктивизацииСтроки(Элемент)
	
	ОбновитьДоступностьСравнения();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Сравнить(Команда)
	
	Данные = Элементы.ДеревоТестовОшибки.ТекущиеДанные;
	
	Если Данные = Неопределено Или ПустаяСтрока(Данные.ОжидаемоеЗначение) И ПустаяСтрока(Данные.ФактическоеЗначение) Тогда
		Возврат;
	КонецЕсли;
	
	ПараметрыФормы = Новый Структура("ОжидаемоеЗначение, ФактическоеЗначение", Данные.ОжидаемоеЗначение, Данные.ФактическоеЗначение);
	ОткрытьФорму("Обработка.ЮТЮнитТесты.Форма.Сравнение", ПараметрыФормы, ЭтотОбъект, , , , , РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры

&НаКлиенте
Процедура СформироватьНастройки(Команда)
	
	ОткрытьФорму("Обработка.ЮТЮнитТесты.Форма.СозданиеНастройки", , ЭтотОбъект);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗамерВремениВыполнения(Команда)
	
	Обработчик = Новый ОписаниеОповещения("ПослеВодаКоличестваИтерацийЗамера", ЭтотОбъект);
	ПоказатьВводЧисла(Обработчик, 100, "Укажите количество итераций замера", 3, 0);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗапуститьВсеТесты(Команда)
	
	ВыполнитьТестовыеМодули(ИсполняемыеТестовыеМодули);
	
КонецПроцедуры

&НаКлиенте
Процедура ПерезапуститьУпавшиеТесты(Команда)
	
	СтатусыИсполненияТеста = ЮТФабрика.СтатусыИсполненияТеста();
	Статусы = ЮТОбщий.ЗначениеВМассиве(СтатусыИсполненияТеста.Ошибка, СтатусыИсполненияТеста.Сломан);
	
	Модули = МодулиСоответствующиеСтатусу(Статусы);
	ВыполнитьТестовыеМодули(Модули);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗапуститьВыделенныеТесты(Команда)
	
	Модули = ВыделенныеТестовыеМодули();
	ВыполнитьТестовыеМодули(Модули);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

#Область ВыводОтчета

&НаСервереБезКонтекста
Функция ДанныеОтчета(Знач АдресХранилища)
	
	Данные = ПолучитьИзВременногоХранилища(АдресХранилища);
	УдалитьИзВременногоХранилища(АдресХранилища);
	
	Возврат Данные;
	
КонецФункции

&НаКлиенте
Процедура ОтобразитьРезультатТеста(СтрокаТеста, Тест, Набор)
	
	СтрокаТеста.Представление = Тест.Имя;
	СтрокаТеста.Контекст = НормализоватьКонтекст(Набор.Режим);
	СтрокаТеста.ПредставлениеВремяВыполнения = ЮТОбщий.ПредставлениеПродолжительности(Тест.Длительность);
	СтрокаТеста.ВремяВыполнения = Тест.Длительность;
	СтрокаТеста.Состояние = Тест.Статус;
	СтрокаТеста.ТипОбъекта = 3;
	СтрокаТеста.Иконка = КартинкаСтатуса(Тест.Статус);
	
	ЗаполнитьОшибки(СтрокаТеста, Тест);
	
КонецПроцедуры

&НаКлиенте
Функция ОбновитьСтатистикуНабора(СтрокаНабора)
	
	СтатистикаНабора = СтатистикаНабора(СтрокаНабора);
	Статусы = ЮТФабрика.СтатусыИсполненияТеста();
	
	Если СтатистикаНабора.Сломано Тогда
		СтрокаНабора.Состояние = Статусы.Сломан;
	ИначеЕсли СтатистикаНабора.Упало Тогда
		СтрокаНабора.Состояние = Статусы.Ошибка;
	ИначеЕсли СтатистикаНабора.Пропущено Тогда
		СтрокаНабора.Состояние = Статусы.Пропущен;
	ИначеЕсли СтатистикаНабора.Неизвестно Тогда
		СтрокаНабора.Состояние = Статусы.Ошибка;
	ИначеЕсли СтатистикаНабора.Ожидание Тогда
		СтрокаНабора.Состояние = Статусы.Ожидание;
	Иначе
		СтрокаНабора.Состояние = Статусы.Успешно;
	КонецЕсли;
	
	СтрокаНабора.Прогресс = ГрафическоеПредставлениеСтатистики(СтатистикаНабора);
	СтрокаНабора.Иконка = КартинкаСтатуса(СтрокаНабора.Состояние);
	
	СтрокаНабора.ПредставлениеВремяВыполнения = ЮТОбщий.ПредставлениеПродолжительности(СтатистикаНабора.Продолжительность);
	СтрокаНабора.ВремяВыполнения = СтатистикаНабора.Продолжительность;
	
	Возврат СтатистикаНабора;
	
КонецФункции

&НаКлиенте
Процедура ОбновитьОбщуюСтатистику(ОбновлятьСтатистикуНаборов)
	
	ОбщаяСтатистика = Статистика();
	
	Для Каждого СтрокаНабора Из ДеревоТестов.ПолучитьЭлементы() Цикл
		
		Если ОбновлятьСтатистикуНаборов Тогда
			СтатистикаНабора = ОбновитьСтатистикуНабора(СтрокаНабора);
		Иначе
			СтатистикаНабора = СтатистикаНабора(СтрокаНабора);
		КонецЕсли;
		
		Для Каждого Элемент Из СтатистикаНабора Цикл
			ЮТОбщий.Инкремент(ОбщаяСтатистика[Элемент.Ключ], Элемент.Значение);
		КонецЦикла;
		
	КонецЦикла;
	
	Элементы.СтатистикаВыполнения.Заголовок = ПредставлениеСтатистики(ОбщаяСтатистика);

КонецПроцедуры

&НаКлиенте
Функция СтатистикаНабора(СтрокаНабора)
	
	СтатистикаНабора = Статистика();
	Статусы = ЮТФабрика.СтатусыИсполненияТеста();
	
	Для Каждого СтрокаТеста Из СтрокаНабора.ПолучитьЭлементы() Цикл
		
		ИнкрементСтатистики(СтатистикаНабора, СтрокаТеста.Состояние, Статусы);
		ЮТОбщий.Инкремент(СтатистикаНабора.Продолжительность, СтрокаТеста.ВремяВыполнения);
		
	КонецЦикла;
	
	Возврат СтатистикаНабора;
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Процедура ЗаполнитьОшибки(СтрокаДерева, ОписаниеОбъекта)
	
	Для Каждого Ошибка Из ОписаниеОбъекта.Ошибки Цикл
		
		СтрокаОшибки = СтрокаДерева.Ошибки.Добавить();
		СтрокаОшибки.Сообщение = Ошибка.Сообщение;
		СтрокаОшибки.Стек = Ошибка.Стек;
		СтрокаОшибки.ОжидаемоеЗначение = ЮТКоллекции.ЗначениеСтруктуры(Ошибка, "ОжидаемоеЗначение");
		СтрокаОшибки.ФактическоеЗначение = ЮТКоллекции.ЗначениеСтруктуры(Ошибка, "ПроверяемоеЗначение");
		
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Функция Статистика()
	
	Статистика = Новый Структура();
	Статистика.Вставить("Всего", 0);
	Статистика.Вставить("Успешно", 0);
	Статистика.Вставить("Упало", 0);
	Статистика.Вставить("Сломано", 0);
	Статистика.Вставить("Пропущено", 0);
	Статистика.Вставить("Ожидание", 0);
	Статистика.Вставить("Неизвестно", 0);
	Статистика.Вставить("Продолжительность", 0);
	
	Возврат Статистика;
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Функция НормализоватьКонтекст(Контекст)
	
	Если СтрНачинаетсяС(Контекст, "Клиент") Тогда
		Возврат "Клиент";
	Иначе
		Возврат Контекст;
	КонецЕсли;
	
КонецФункции

&НаКлиентеНаСервереБезКонтекста
Процедура ИнкрементСтатистики(Статистика, Статус, Знач Статусы = Неопределено)
	
	Если Статусы = Неопределено Тогда
		Статусы = ЮТФабрика.СтатусыИсполненияТеста();
	КонецЕсли;
	
	ЮТОбщий.Инкремент(Статистика.Всего);
	
	Если Статус = Статусы.Успешно Тогда
		
		ЮТОбщий.Инкремент(Статистика.Успешно);
		
	ИначеЕсли Статус = Статусы.Сломан ИЛИ Статус = Статусы.НеРеализован Тогда
		
		ЮТОбщий.Инкремент(Статистика.Сломано);
		
	ИначеЕсли Статус = Статусы.Ошибка Тогда
		
		ЮТОбщий.Инкремент(Статистика.Упало);
		
	ИначеЕсли Статус = Статусы.Пропущен Тогда
		
		ЮТОбщий.Инкремент(Статистика.Пропущено);
		
	ИначеЕсли Статус = Статусы.Ожидание Тогда
		
		ЮТОбщий.Инкремент(Статистика.Ожидание);
		
	Иначе
		
		ЮТОбщий.Инкремент(Статистика.Неизвестно);
		
	КонецЕсли;
	
КонецПроцедуры

#КонецОбласти

#Область Интерфейсное

&НаСервереБезКонтекста
Функция КартинкаСтатуса(Статус)
	
	Статусы = ЮТФабрика.СтатусыИсполненияТеста();
	
	Если Статус = Статусы.Успешно Тогда
		
		Возврат БиблиотекаКартинок.ЮТУспешно;
		
	ИначеЕсли Статус = Статусы.Сломан ИЛИ Статус = Статусы.НеРеализован Тогда
		
		Возврат БиблиотекаКартинок.ЮТОшибка;
		
	ИначеЕсли Статус = Статусы.Ошибка Тогда
		
		Возврат БиблиотекаКартинок.ЮТУпал;
		
	ИначеЕсли Статус = Статусы.Пропущен Тогда
		
		Возврат БиблиотекаКартинок.ЮТПропущен;
		
	Иначе
		
		Возврат БиблиотекаКартинок.ЮТНеизвестный;
		
	КонецЕсли;
	
КонецФункции

&НаСервереБезКонтекста
Функция ПредставлениеСтатистики(Статистика)
	
	БлокиСтатистики = Новый Массив();
	Разделитель = ";    ";
	
	БлокиСтатистики.Добавить(СтрШаблон("Тестов: %1/%2", Статистика.Всего - Статистика.Пропущено - Статистика.Ожидание, Статистика.Всего));
	
	Если Статистика.Ожидание Тогда
		БлокиСтатистики.Добавить(Разделитель);
		БлокиСтатистики.Добавить(БиблиотекаКартинок.ЮТНеизвестный);
		БлокиСтатистики.Добавить(" Ожидание: " + Статистика.Ожидание);
	КонецЕсли;
	
	Если Статистика.Пропущено Тогда
		БлокиСтатистики.Добавить(Разделитель);
		БлокиСтатистики.Добавить(БиблиотекаКартинок.ЮТПропущен);
		БлокиСтатистики.Добавить(" Пропущено: " + Статистика.Пропущено);
	КонецЕсли;
	
	БлокиСтатистики.Добавить(Разделитель);
	БлокиСтатистики.Добавить(БиблиотекаКартинок.ЮТУспешно);
	БлокиСтатистики.Добавить(" Успешно: " + Статистика.Успешно);
	
	БлокиСтатистики.Добавить(Разделитель);
	БлокиСтатистики.Добавить(БиблиотекаКартинок.ЮТОшибка);
	БлокиСтатистики.Добавить(" Сломано: " + Статистика.Сломано);
	
	БлокиСтатистики.Добавить(Разделитель);
	БлокиСтатистики.Добавить(БиблиотекаКартинок.ЮТУпал);
	БлокиСтатистики.Добавить(" Упало: " + Статистика.Упало);
	
	Если Статистика.Неизвестно Тогда
		БлокиСтатистики.Добавить(Разделитель);
		БлокиСтатистики.Добавить(БиблиотекаКартинок.ЮТНеизвестный);
		БлокиСтатистики.Добавить(" Неизвестно: " + Статистика.Неизвестно);
	КонецЕсли;
	
	БлокиСтатистики.Добавить(Разделитель);
	БлокиСтатистики.Добавить(" Время выполнения: " + ЮТОбщий.ПредставлениеПродолжительности(Статистика.Продолжительность));
	
	Возврат Новый ФорматированнаяСтрока(БлокиСтатистики);
	
КонецФункции

&НаСервереБезКонтекста
Функция ГрафическоеПредставлениеСтатистики(Статистика)
	
	Текст = БлокиСтатистики(Статистика);
	
	Возврат Новый Картинка(ПолучитьДвоичныеДанныеИзСтроки(Текст));
	
КонецФункции

&НаСервереБезКонтекста
Функция БлокиСтатистики(Статистика)
	
	Блоки = Новый Массив();
	Ключи = "Количество, Цвет";
	
	Блоки.Добавить(Новый Структура(Ключи, Статистика.Успешно, "25AE88"));
	Блоки.Добавить(Новый Структура(Ключи, Статистика.Пропущено, "999999"));
	Блоки.Добавить(Новый Структура(Ключи, Статистика.Упало, "EFCE4A"));
	Блоки.Добавить(Новый Структура(Ключи, Статистика.Сломано, "D75A4A"));
	Блоки.Добавить(Новый Структура(Ключи, Статистика.Ожидание, "BBBBBB"));
	Блоки.Добавить(Новый Структура(Ключи, Статистика.Неизвестно, "9400d3"));
	
	Сдвиг = 0;
	Высота = 20;
	
	Текст = "";
	
	Для Инд = 0 По Блоки.ВГраница() Цикл
		
		Если Блоки[Инд].Количество = 0 Тогда
			Продолжить;
		КонецЕсли;
		
		Текст = Текст + СтрШаблон("	<rect x=""%1"" y=""2"" width=""%2"" height=""%3"" rx=""4"" ry=""4"" style=""fill:none;stroke:#%4;stroke-width:2""/>
								  |	<text x=""%5"" y=""%6"" dominant-baseline=""middle"" text-anchor=""middle"" style=""fill:#%4;"">%7</text>
								  |", Сдвиг + 2, Высота * 2 - 4, Высота - 4, Блоки[Инд].Цвет, Сдвиг + Высота, Высота - 4, Блоки[Инд].Количество);
		ЮТОбщий.Инкремент(Сдвиг, Высота * 2 + 2);
		
	КонецЦикла;
	
	Возврат СтрШаблон("<svg version=""1.1"" xmlns=""http://www.w3.org/2000/svg"" xmlns:xlink=""http://www.w3.org/1999/xlink"" x=""0px"" y=""0px"" width=""%1px"" height=""%2px""
					  |	 viewBox=""0 0 %1 %2"">
					  |	%3
					  |</svg>", Сдвиг, Высота + 2, Текст);
	
КонецФункции

#КонецОбласти

#Область ЗагрузкаТестов

&НаКлиенте
Процедура ЗагрузитьТесты()
	
	ПараметрыЗапуска = ПараметрыЗапуска();
	
	ПараметрыЗагрузки = ЮТИсполнительКлиент.ПараметрыИсполнения();
	ПараметрыЗагрузки.Цепочка.Добавить(Новый ОписаниеОповещения("ПослеЗагрузкиТестов", ЭтотОбъект, ПараметрыЗапуска));
	ПараметрыЗагрузки.ПараметрыЗапуска = ПараметрыЗапуска;
	
	ЮТСобытия.Инициализация(ПараметрыЗагрузки.ПараметрыЗапуска);
	ЮТИсполнительКлиент.ОбработчикЗагрузитьТесты(Неопределено, ПараметрыЗагрузки);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗагрузкиТестов(Результат, ПараметрыЗапуска) Экспорт
	
	ИсполняемыеТестовыеМодули = Результат;
	ПараметрыЗапускаТестирования = ПараметрыЗапуска;
	
	Для Каждого ТестовыйМодуль Из ИсполняемыеТестовыеМодули Цикл
		
		Для Каждого Набор Из ТестовыйМодуль.НаборыТестов Цикл
			
			СтрокаНабора = ДеревоТестов.ПолучитьЭлементы().Добавить();
			СтрокаНабора.Набор = Истина;
			СтрокаНабора.Представление = Набор.Представление;
			СтрокаНабора.Контекст = НормализоватьКонтекст(Набор.Режим);
			СтрокаНабора.ПредставлениеВремяВыполнения = ЮТОбщий.ПредставлениеПродолжительности(Набор.Длительность);
			СтрокаНабора.ВремяВыполнения = Набор.Длительность;
			СтрокаНабора.ТипОбъекта = 2;
			
			ЗаполнитьОшибки(СтрокаНабора, Набор);
			
			Набор.Вставить("Идентификатор", СтрокаНабора.ПолучитьИдентификатор());
			
			Для Каждого Тест Из Набор.Тесты Цикл
				
				СтрокаТеста = СтрокаНабора.ПолучитьЭлементы().Добавить();
				
				ОтобразитьРезультатТеста(СтрокаТеста, Тест, Набор);
				
				Тест.Вставить("Идентификатор", СтрокаТеста.ПолучитьИдентификатор());
				
			КонецЦикла;
			
		КонецЦикла;
		
	КонецЦикла;
	
	ОбновитьОбщуюСтатистику(Истина);
	
	ЮТКонтекст.УдалитьКонтекст();
	
КонецПроцедуры

#КонецОбласти

#Область ЗапускТестов

&НаКлиенте
Процедура ВыполнитьТестовыеМодули(Модули)
	
	Если Модули.Количество() = 0 Тогда
		ПоказатьПредупреждение(, "Нет тестов для запуска");
		Возврат;
	КонецЕсли;
	
	ОповещениеПользователю("Прогон тестов", "Запушено выполнение тестов");
	
	ЮТСобытия.Инициализация(ПараметрыЗапускаТестирования);
	ЮТСобытия.ПослеФормированияИсполняемыхНаборовТестов(Модули);
	ЮТСобытия.ПередВыполнениемТестов(Модули);
	
	Для Каждого Модуль Из Модули Цикл
		
		СброситьСостояниеТестирования(Модуль);
		
		Результат = ЮТИсполнительКлиент.ВыполнитьТестыМодуля(Модуль);
		
		Для Каждого Набор Из Результат.НаборыТестов Цикл
			
			Для Каждого Тест Из Набор.Тесты Цикл
				
				Строка = ДеревоТестов.НайтиПоИдентификатору(Тест.Идентификатор);
				ОтобразитьРезультатТеста(Строка, Тест, Набор);
				
			КонецЦикла;
			
			Строка = ДеревоТестов.НайтиПоИдентификатору(Набор.Идентификатор);
			ОбновитьСтатистикуНабора(Строка);
			
		КонецЦикла;
		
	КонецЦикла;
	
	ОбновитьОбщуюСтатистику(Ложь);
	
	ЮТКонтекст.УдалитьКонтекст();
	
	ОповещениеПользователю("Прогон тестов завершен", "Завершено выполнение тестов");
	
КонецПроцедуры

&НаКлиенте
Процедура СброситьСостояниеТестирования(Модуль)
	
	Статусы = ЮТФабрика.СтатусыИсполненияТеста();
	
	Модуль.Ошибки.Очистить();
	
	Для Каждого Набор Из Модуль.НаборыТестов Цикл
		Набор.Ошибки.Очистить();
		Набор.Выполнять = Истина;
		
		Для Каждого Тест Из Набор.Тесты Цикл
			Тест.Ошибки.Очистить();
			Тест.Статус = Статусы.Ожидание;
		КонецЦикла;
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Функция ВыделенныеТестовыеМодули()
	
	МодулиКЗапуску = Новый Массив();
	
	ВыделенныеСтроки = Элементы.ДеревоТестов.ВыделенныеСтроки;
	
	Если ВыделенныеСтроки.Количество() = 0 Тогда
		Возврат МодулиКЗапуску;
	КонецЕсли;
	
	Для Каждого Модуль Из ИсполняемыеТестовыеМодули Цикл
		
		НаборыКЗапуску = Новый Массив();
		
		Для Каждого Набор Из Модуль.НаборыТестов Цикл
			
			Если ВыделенныеСтроки.Найти(Набор.Идентификатор) <> Неопределено Тогда
				НаборыКЗапуску.Добавить(Набор);
				Продолжить;
			КонецЕсли;
			
			ТестыКЗапуску = Новый Массив();
			
			Для Каждого Тест Из Набор.Тесты Цикл
				Если ВыделенныеСтроки.Найти(Тест.Идентификатор) <> Неопределено Тогда
					ТестыКЗапуску.Добавить(Тест);
				КонецЕсли;
			КонецЦикла;
			
			Если ТестыКЗапуску.Количество() Тогда
				ЗапускаемыйНабор = ЮТКоллекции.СкопироватьСтруктуру(Набор);
				ЗапускаемыйНабор.Тесты = ТестыКЗапуску;
				НаборыКЗапуску.Добавить(ЗапускаемыйНабор);
			КонецЕсли;
			
		КонецЦикла;
		
		Если НаборыКЗапуску.Количество() Тогда
			
			ЗапускаемыйМодуль = ЮТКоллекции.СкопироватьСтруктуру(Модуль);
			ЗапускаемыйМодуль.НаборыТестов = НаборыКЗапуску;
			МодулиКЗапуску.Добавить(ЗапускаемыйМодуль);
			
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат МодулиКЗапуску;
	
КонецФункции

&НаКлиенте
Функция МодулиСоответствующиеСтатусу(Статусы)
	
	МодулиКЗапуску = Новый Массив();
	
	Для Каждого Модуль Из ИсполняемыеТестовыеМодули Цикл
		
		НаборыКЗапуску = Новый Массив();
		
		Для Каждого Набор Из Модуль.НаборыТестов Цикл
			
			ТестыКЗапуску = Новый Массив();
			
			Для Каждого Тест Из Набор.Тесты Цикл
				Если Статусы.Найти(Тест.Статус) <> Неопределено Тогда
					ТестыКЗапуску.Добавить(Тест);
				КонецЕсли;
			КонецЦикла;
			
			Если ТестыКЗапуску.Количество() Тогда
				ЗапускаемыйНабор = ЮТКоллекции.СкопироватьСтруктуру(Набор);
				ЗапускаемыйНабор.Тесты = ТестыКЗапуску;
				НаборыКЗапуску.Добавить(ЗапускаемыйНабор);
			КонецЕсли;
			
		КонецЦикла;
		
		Если НаборыКЗапуску.Количество() Тогда
			
			ЗапускаемыйМодуль = ЮТКоллекции.СкопироватьСтруктуру(Модуль);
			ЗапускаемыйМодуль.НаборыТестов = НаборыКЗапуску;
			МодулиКЗапуску.Добавить(ЗапускаемыйМодуль);
			
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат МодулиКЗапуску;
	
КонецФункции

&НаКлиенте
Процедура ВыполнитьЗапускТестовПоПараметрам(ПараметрыЗапуска, Обработчик)
	
	ЮТИсполнительКлиент.ВыполнитьМодульноеТестированиеПоНастройке(ПараметрыЗапуска, Обработчик);
	
КонецПроцедуры

#КонецОбласти

#Область ПараметрыЗапуска

&НаКлиенте
Функция ПараметрыЗапуска()
	
	ПараметрыЗапуска = ЮТФабрика.ПараметрыЗапуска();
	ПараметрыЗапуска.closeAfterTests = Ложь;
	ПараметрыЗапуска.showReport = Ложь;
	ПараметрыЗапуска.ВыполнятьМодульноеТестирование = Истина;
	
	Возврат ПараметрыЗапуска;
	
КонецФункции

#КонецОбласти
&НаКлиенте
Процедура ОбновитьДоступностьСравнения()
	
	Данные = Элементы.ДеревоТестовОшибки.ТекущиеДанные;
	Элементы.Сравнить.Доступность = Данные <> Неопределено И (НЕ ПустаяСтрока(Данные.ОжидаемоеЗначение) Или НЕ ПустаяСтрока(Данные.ФактическоеЗначение));
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеВодаКоличестваИтерацийЗамера(Результат, ДополнительныеПараметры) Экспорт
	
	Если НЕ ЗначениеЗаполнено(Результат) Тогда
		Возврат;
	КонецЕсли;
	
	ПараметрыЗамера = Новый Структура();
	ПараметрыЗамера.Вставить("ПараметрыЗапуска", ПараметрыЗапуска());
	ПараметрыЗамера.Вставить("КоличествоИтераций", Результат);
	ПараметрыЗамера.Вставить("ТекущаяИтерация", 0);
	ПараметрыЗамера.Вставить("Замеры", Новый Массив());
	ПараметрыЗамера.Вставить("НачалоИтерации");
	
	ПослеВыполненияИтерации(Неопределено, ПараметрыЗамера);
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеВыполненияИтерации(Результат, ПараметрыЗамера) Экспорт
	
	Если ПараметрыЗамера.ТекущаяИтерация > 0 Тогда
		Длительность = ТекущаяУниверсальнаяДатаВМиллисекундах() - ПараметрыЗамера.НачалоИтерации;
		ПараметрыЗамера.Замеры.Добавить(Длительность);
	КонецЕсли;
	
	Если ЮТОбщий.Инкремент(ПараметрыЗамера.ТекущаяИтерация) <= ПараметрыЗамера.КоличествоИтераций Тогда
		
		Обработчик = Новый ОписаниеОповещения("ПослеВыполненияИтерации", ЭтотОбъект, ПараметрыЗамера);
		ПараметрыЗамера.НачалоИтерации = ТекущаяУниверсальнаяДатаВМиллисекундах();
		ВыполнитьЗапускТестовПоПараметрам(ПараметрыЗамера.ПараметрыЗапуска, Обработчик);
		
	Иначе
		
		ОбщееВремя = 0;
		Для Каждого Замер Из ПараметрыЗамера.Замеры Цикл
			ЮТОбщий.Инкремент(ОбщееВремя, Замер);
		КонецЦикла;
		
		Список = Новый СписокЗначений();
		Список.ЗагрузитьЗначения(ПараметрыЗамера.Замеры);
		Список.СортироватьПоЗначению();
		
		ОбщееВремя = Окр(ОбщееВремя / 1000, 2);
		СреднееВремя = Окр(ОбщееВремя / ПараметрыЗамера.Замеры.Количество(), 2);
		МедианноеВремя = Окр(Список[Цел(Список.Количество() / 2) + 1].Значение / 1000, 2);
		
		Сообщение = СтрШаблон("Количество итераций: %1
		|Общее время: %2 сек
		|Среднее время: %3 сек
		|Медианное время: %4 сек", ПараметрыЗамера.Замеры.Количество(), ОбщееВремя, СреднееВремя, МедианноеВремя);
		
		ЮТОбщий.СообщитьПользователю(Сообщение);
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ОповещениеПользователю(Текст, Пояснение)
	
	ПоказатьОповещениеПользователя(Текст,
								   ,
								   Пояснение,
								   БиблиотекаКартинок.ЮТПодсистема,
								   СтатусОповещенияПользователя.Важное,
								   УникальныйИдентификатор);
	
КонецПроцедуры

#КонецОбласти
