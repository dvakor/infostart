Функция Index() Экспорт

	Если ЗапросHttp.Метод = "POST" Тогда

		НовоеИмяБота = ЗапросHttp.ДанныеФормы["name"];
		ИмяКлассаБота = ЗапросHttp.ДанныеФормы["class"];

		Если НЕ УправлениеБотами.БотСуществует(НовоеИмяБота) Тогда
			УправлениеБотами.Добавить(НовоеИмяБота, ИмяКлассаБота);
		КонецЕсли;

		Возврат Представление("Post");

	ИначеЕсли ЗапросHttp.Метод = "GET" Тогда

		Возврат Содержимое("GET");

	КонецЕсли;

КонецФункции
