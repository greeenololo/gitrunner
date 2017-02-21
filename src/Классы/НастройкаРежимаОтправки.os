Перем мТекущаяНастройкаОтправки;
Перем мОтправкаRefspec;
Перем мГитРепозиторий;

Функция ПолучитьНастройки() Экспорт
	
	Возврат мТекущаяНастройкаОтправки;
	
КонецФункции

Процедура УстановитьНастройки(Знач НовыеНастройкиОтправки) Экспорт
	
	мТекущаяНастройкаОтправки = НовыеНастройкиОтправки;
	
КонецПроцедуры

Процедура УстановитьГитРепозиторий(Знач ГитРепозиторий) Экспорт
	
	мГитРепозиторий = ГитРепозиторий;
	
КонецПроцедуры

Процедура Отправить() Экспорт
	
	ПараметрыЗапуска = ПолучитьПараметрыКоманды();
	ПараметрыЗапуска.Вставить(0, "push");

	мГитРепозиторий.ВыполнитьКоманду(ПараметрыЗапуска);

КонецПроцедуры

Функция ПолучитьПараметрыКоманды() Экспорт
	
	МассивПараметров = Новый Массив;
	
	Для каждого Настройка Из мТекущаяНастройкаОтправки Цикл
		
		Если Настройка.Ключ = "ЗаголовкиОтправки" Тогда
			Для Каждого Заголовок Из Настройка.Значение Цикл
				МассивПараметров.Добавить(Заголовок)
			КонецЦикла;
			
		Иначе
			
			УстановитьПараметрКоманды(МассивПараметров, Настройка.Ключ, Настройка.Значение);
			
		КонецЕсли;
		
	КонецЦикла;
	
	УдалитьВзаимоисключающиеПараметры(МассивПараметров);
	
	Возврат МассивПараметров;
	
КонецФункции // ПолучитьНастройкиКоманды() Экспорт

Процедура ДобавитьПроизвольныйЗаголовокОтправки(Знач ЗаголовокОтправки) Экспорт
	
	ТекущиеЗаголовкиОтправки = мТекущаяНастройкаОтправки.Получить("ЗаголовкиОтправки");
	
	ПроверитьЗаголовкиНаRefspec(ЗаголовокОтправки);
	
	ТекущиеЗаголовкиОтправки.Добавить(ЗаголовокОтправки);
	
	мТекущаяНастройкаОтправки.Вставить("ЗаголовкиОтправки", ТекущиеЗаголовкиОтправки);
	
КонецПроцедуры

Процедура ДобавитьЗаголовкиОтправки(ЗаголовокРабочейКопии = "", ЗаголовокУдаленногоСервера = "") Экспорт
	
	НовыйЗаголовокОтправки = "";
	
	Если НЕ ЗначениеЗаполнено(ЗаголовокУдаленногоСервера) Тогда
		
		НовыйЗаголовокОтправки = СтрШаблон("%1", ЗаголовокРабочейКопии);
		
	Иначе
		
		НовыйЗаголовокОтправки = СтрШаблон("%1:%2",ЗаголовокРабочейКопии, ЗаголовокУдаленногоСервера);
		
	КонецЕслИ;
	
	ДобавитьПроизвольныйЗаголовокОтправки(НовыйЗаголовокОтправки);
	
КонецПроцедуры

Процедура ОтображатьПрогресс(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--progress", ЗначениеУстановки);
	
КонецПроцедуры

Процедура РежимТишины(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--quiet", ЗначениеУстановки);
	
КонецПроцедуры

Процедура РежимЗеркала(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--mirror", ЗначениеУстановки);
	
КонецПроцедуры 

Процедура РежимУдаления(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--delete", ЗначениеУстановки);
	
КонецПроцедуры

Процедура ПолнаяОтправка(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--all", ЗначениеУстановки);
	
КонецПроцедуры

Процедура ПерезаписатьИсторию(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--force", ЗначениеУстановки);
	
КонецПроцедуры

Процедура Отслеживать(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--set-upstream", ЗначениеУстановки);
	
КонецПроцедуры

Процедура РежимПрограммнойОбработкаРезультата(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--porcelain", ЗначениеУстановки);
	
КонецПроцедуры

Процедура ОтправкаТэгов(Знач ЗначениеУстановки = Истина) Экспорт
	
	УстановитьПроизвольныйРежим("--tags", ЗначениеУстановки);
	
КонецПроцедуры

Процедура УстановитьПроизвольныйРежим(Знач НаименованиеФала, Знач ЗначениеУстановки = Истина) Экспорт
	
	мТекущаяНастройкаОтправки.Вставить(НаименованиеФала, ЗначениеУстановки);
	
КонецПроцедуры

Процедура ЗаполнитьНастройкиПоУмолчанию()
	
	мТекущаяНастройкаОтправки.Вставить("ЗаголовкиОтправки", Новый Массив);
	мТекущаяНастройкаОтправки.Вставить("--tags", Ложь);
	мТекущаяНастройкаОтправки.Вставить("--porcelain", Истина);
	мТекущаяНастройкаОтправки.Вставить("--delete", Ложь);
	мТекущаяНастройкаОтправки.Вставить("--progress", Ложь);
	мТекущаяНастройкаОтправки.Вставить("--quiet", Ложь);
	мТекущаяНастройкаОтправки.Вставить("--all", Ложь);
	
	мОтправкаRefspec = Ложь;
	
КонецПроцедуры

Процедура ПроверитьЗаголовкиНаRefspec(Знач ЗаголовокОтправки)
	
	Если мОтправкаRefspec Тогда
		Возврат;
	КонецЕсли;	
	
	Если СтрНайти("refs/", ЗаголовокОтправки) > 0 Тогда
		
		мОтправкаRefspec = Истина;
		
	КонецЕсли;
	
КонецПроцедуры

Процедура УстановитьПараметрКоманды(МассивПараметров, Знач КлючПараметра, Знач НадоУстановить)
	
	Если Не НадоУстановить Тогда
		Возврат;
	КонецЕсли;
	
	Если ПараметрСовместимСRefspec(КлючПараметра) Тогда
		МассивПараметров.Добавить(КлючПараметра);
	КонецЕсли;	
	
КонецПроцедуры

Процедура УдалитьВзаимоисключающиеПараметры(МассивПараметров)
	
	МассивПроверки = МассивВзаимоисключающихПараметров();
	
	ЭлементПроверки = Неопределено;
	
	Для каждого Параметр Из МассивПараметров Цикл
		
		ИндексЭлементаПроверки = МассивПроверки.Найти(Параметр);
		
		Если НЕ ИндексЭлементаПроверки = Неопределено Тогда
			ЭлементПроверки = МассивПроверки.Получить(ИндексЭлементаПроверки);
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	Если НЕ ЭлементПроверки = Неопределено Тогда
		
		Для каждого ПараметрДляУдаления Из МассивПроверки Цикл
			
			Если ЭлементПроверки = ПараметрДляУдаления Тогда
				Продолжить;
			КонецЕсли;
			
			ИндексЭлементаУдаления = МассивПараметров.Найти(ПараметрДляУдаления);
			
			Если НЕ ИндексЭлементаУдаления = Неопределено Тогда
				МассивПараметров.Удалить(ИндексЭлементаУдаления);
			КонецЕсли;
			
		КонецЦикла;
		
	КонецЕслИ;

КонецПроцедуры

Функция ПараметрСовместимСRefspec(Знач КлючПараметра)
	
	Если Не мОтправкаRefspec Тогда
		Возврат Истина;
	КонецЕсли;
	
	МассивПроверки = МассивНесовместимыхПараметровСRefspec();
	Если ЗначениеЗаполнено(МассивПроверки.Найти(КлючПараметра)) Тогда
		Возврат Ложь;
	КонецЕслИ;
	
КонецФункции // ПроверитьСовместимостьПараметра()

Функция МассивНесовместимыхПараметровСRefspec()
	
	ФиксированныйМассив = Новый Массив;
	ФиксированныйМассив.Добавить("--all");
	ФиксированныйМассив.Добавить("--mirror");
	ФиксированныйМассив.Добавить("--tags");
	
	Возврат ФиксированныйМассив;
	
КонецФункции

Функция МассивВзаимоисключающихПараметров()
	
	ФиксированныйМассив = Новый Массив;
	ФиксированныйМассив.Добавить("--all");
	ФиксированныйМассив.Добавить("--mirror");
	ФиксированныйМассив.Добавить("--tags");
	
	Возврат ФиксированныйМассив;

КонецФункции

Процедура Инициализация()
	
	мТекущаяНастройкаОтправки = Новый Соответствие;
	ЗаполнитьНастройкиПоУмолчанию();
	
КонецПроцедуры

Инициализация();


