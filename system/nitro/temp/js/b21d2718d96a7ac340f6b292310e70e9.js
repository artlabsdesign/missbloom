
		var options = {
      element: {
			  priceScale     : $('#scale-price-0'), // Slide scale element
			  priceMin       : $('#min-price-value-0'),  // Price min field
			  priceMax       : $('#max-price-value-0'),  // Price max field
			  priceFrom      : $('#price-from-0'),// Price from elemenet
			  priceTo        : $('#price-to-0'),  // Price to elemenet
			  submitButton   : $('#button-submit-0'),
			  floatButton    : $('#button-float-0'),
        scales         : $('.scale-0')
			},
      php: {
				module       : 0,
				minPrice     : 250,
				maxPrice     : 250,
				minPriceValue: 250,
				maxPriceValue: 250,
		    showButton   : 0,
		    showPrice    : 0,
		    showCounter  : 1,
				manualPrice  : 0,
		    total        : 1,
        link         : 'http://missbloom.ru/cveti',
		    path         : '60',
		    params       : '',
		    index        : 'filter_ocfilter'
		  },
      text: {
		    show_all: 'Показать все',
		    hide    : 'Скрыть',
		    load    : 'Загрузка...',
				any     : 'Все',
		    select  : 'Укажите параметры'
		  },
			sliders      : []
		};

						
    $('#ocfilter-0').ocfilter(options);
	//