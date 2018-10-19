Функция Index() Экспорт

	Если ЗапросHttp.Метод = "POST" Тогда

		НовоеИмяБота = ЗапросHttp.ДанныеФормы["name"];
		ИмяКлассаБота = ЗапросHttp.ДанныеФормы["class"];

		ОписанияБотов = ЗагрузитьБотов();
		Если Не БотСуществует(НовоеИмяБота, ОписанияБотов) Тогда
			ДобавитьБота(НовоеИмяБота, ИмяКлассаБота, ОписанияБотов);
		КонецЕсли;

		// Возврат Содержимое("POST");
		Возврат Представление("Post");

	ИначеЕсли ЗапросHttp.Метод = "GET" Тогда

		Возврат Содержимое("GET");

	КонецЕсли;

КонецФункции

Функция ЗагрузитьБотов()
	ЧтениеJSON = Новый ЧтениеJSON();
	ЧтениеJSON.ОткрытьФайл("bots.json");
	ОписанияБотов = ПрочитатьJSON(ЧтениеJSON);
	Возврат ОписанияБотов;
КонецФункции

Функция БотСуществует(ИмяБота, ОписанияБота)
	Для каждого Описание Из ОписанияБота Цикл
		Если Описание.name = ИмяБота Тогда
			Возврат Истина;
		КонецЕсли;
	КонецЦикла;
	Возврат Ложь;
КонецФункции

Процедура ДобавитьБота(НовоеИмяБота, ИмяКласса, ОписанияБотов)
	НовоеОписание = ОписанияБотов.Добавить();
	НовоеОписание.name = НовоеИмяБота;
	НовоеОписание.class = ИмяКласса;
КонецПроцедуры
