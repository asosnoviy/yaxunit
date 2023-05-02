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

#Область СлужебныйПрограммныйИнтерфейс

Процедура ИсполняемыеСценарии() Экспорт
	
	ЮТТесты
		.ДобавитьТест("СодержитЗаписи")
		.ДобавитьТест("НеСодержитЗаписи")
		.ДобавитьТест("СообщенияОбОшибках")
	;
	
КонецПроцедуры

Процедура СодержитЗаписи() Экспорт
	
	Конструктор = ЮТест.Данные().КонструкторОбъекта("Справочники.Товары")
		.Фикция("Наименование")
		.Фикция("Поставщик");
	Конструктор.Записать();
	
	ЮТест.ОжидаетЧтоТаблица("Справочник.Товары")
		.СодержитЗаписи();
	
	ЮТест.ОжидаетЧтоТаблица("Справочник.Товары")
		.СодержитЗаписи(ЮТест.Предикат()
			.Реквизит("Наименование").Равно(Конструктор.ДанныеОбъекта().Наименование));
	
	ЮТест.ОжидаетЧтоТаблица("Справочник.Товары")
		.СодержитЗаписи(ЮТест.Предикат()
			.Реквизит("Поставщик").Равно(Конструктор.ДанныеОбъекта().Поставщик));
	
	ЮТест.ОжидаетЧтоТаблица("Справочник.Товары")
		.СодержитЗаписи(ЮТест.Предикат()
			.Реквизит("Наименование").Равно(Конструктор.ДанныеОбъекта().Наименование)
			.Реквизит("Поставщик").Равно(Конструктор.ДанныеОбъекта().Поставщик));
	
КонецПроцедуры

Процедура НеСодержитЗаписи() Экспорт
	
	Конструктор = ЮТест.Данные().КонструкторОбъекта("Справочники.Товары")
		.Фикция("Наименование")
		.Фикция("Поставщик");
	
	ИмяТаблицы = "Справочник.Товары";
	
	ЮТест.ОжидаетЧтоТаблица(ИмяТаблицы)
		.НеСодержитЗаписи(ЮТест.Предикат()
			.Реквизит("Наименование").Равно(Конструктор.ДанныеОбъекта().Наименование));
	
	ЮТест.ОжидаетЧтоТаблица(ИмяТаблицы)
		.НеСодержитЗаписи(ЮТест.Предикат()
			.Реквизит("Поставщик").Равно(Конструктор.ДанныеОбъекта().Поставщик));
	
	ЮТест.ОжидаетЧтоТаблица(ИмяТаблицы)
		.НеСодержитЗаписи(ЮТест.Предикат()
			.Реквизит("Наименование").Равно(Конструктор.ДанныеОбъекта().Наименование)
			.Реквизит("Поставщик").Равно(Конструктор.ДанныеОбъекта().Поставщик));
	Конструктор.Записать();
	
	ЮТест.ОжидаетЧтоТаблица(ИмяТаблицы)
		.СодержитЗаписи(ЮТест.Предикат()
			.Реквизит("Поставщик").Равно(Конструктор.ДанныеОбъекта().Поставщик));
	
КонецПроцедуры

Процедура СообщенияОбОшибках() Экспорт
	
	МетодНеСодержитЗаписи = "НеСодержитЗаписи";
	МетодСодержитЗаписи = "СодержитЗаписи";
	ТаблицаСправочник = "Справочник.Товары";
	ТаблицаБезЗаписей = "Справочник.МобильныеУстройства";
	
	Наименование = ЮТест.Данные().СлучайнаяСтрока();
	ПредикатНаименование = ЮТест.Предикат()
		.Реквизит("Наименование").Равно(Наименование)
		.Получить();
		
	ЮТест.Данные().КонструкторОбъекта("Справочники.Товары")
		.Установить("Наименование", Наименование)
		.Записать();
	Префикс = "Ожидали, что проверяемая таблица ";
	Варианты = ЮТест.Варианты("ИмяТаблицы, Метод, Предикат, ОжидаемоеСообщение, ОписаниеПроверки, ОписаниеУтверждения")
		
		.Добавить(ТаблицаСправочник, МетодНеСодержитЗаписи, Неопределено,
			Префикс + "`Справочник.Товары` не содержит записи, но это не так.")
		
		.Добавить(ТаблицаСправочник, МетодНеСодержитЗаписи, ПредикатНаименование,
			СтрШаблон("%1`Справочник.Товары` не содержит записи с `Наименование` равно `%2`, но это не так.", Префикс, Наименование))
		
		.Добавить(ТаблицаБезЗаписей, МетодСодержитЗаписи, Неопределено,
			Префикс + "`Справочник.МобильныеУстройства` содержит записи, но это не так.")
		
		.Добавить(ТаблицаБезЗаписей, МетодСодержитЗаписи, Неопределено,
			СтрШаблон("Описание проверки: %1`Справочник.МобильныеУстройства` содержит записи, но это не так.", СтрочнаяПерваяБуква(Префикс)), "Описание проверки")
		
		.Добавить(ТаблицаБезЗаписей, МетодСодержитЗаписи, Неопределено,
			СтрШаблон("Описание проверки: %1`Справочник.МобильныеУстройства` содержит записи, но это не так.", СтрочнаяПерваяБуква(Префикс)), , "Описание проверки")
		
		.Добавить(ТаблицаБезЗаписей, МетодСодержитЗаписи, Неопределено,
			СтрШаблон("Описание проверки: %1`Справочник.МобильныеУстройства` содержит записи, но это не так.", СтрочнаяПерваяБуква(Префикс)), "Описание", "проверки")
	;
	
	Индекс = 1;
	
	Для Каждого Вариант Из Варианты.СписокВариантов() Цикл
		
		ЮТест.ОжидаетЧтоТаблица(Вариант.ИмяТаблицы, Вариант.ОписаниеПроверки);
		
		Ошибка = Неопределено;
		Попытка
			Если Вариант.Метод = МетодНеСодержитЗаписи Тогда
				ЮТУтвержденияИБ.НеСодержитЗаписи(Вариант.Предикат, Вариант.ОписаниеУтверждения);
			ИначеЕсли Вариант.Метод = МетодСодержитЗаписи Тогда
				ЮТУтвержденияИБ.СодержитЗаписи(Вариант.Предикат, Вариант.ОписаниеУтверждения);
			КонецЕсли;
		Исключение
			Ошибка = ИнформацияОбОшибке();
		КонецПопытки;
		
		ПроверитьОшибкуУтверждения(Индекс, Ошибка, Вариант.ОжидаемоеСообщение);
		Индекс = Индекс + 1;
		
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ПроверитьОшибкуУтверждения(Индекс, ИнформацияОбОшибке, ОжидаемоеОписание) Экспорт
	
	ЮТест.ОжидаетЧто(ИнформацияОбОшибке, "Вариант " + Индекс)
		.ЭтоНеНеопределено()
		.Свойство("Описание")
			.НачинаетсяС("[Failed]")
			.Содержит(ОжидаемоеОписание);
	
КонецПроцедуры

Функция СтрочнаяПерваяБуква(Строка)
	Возврат НРег(Лев(Строка, 1)) + Сред(Строка, 2);
КонецФункции

#КонецОбласти
