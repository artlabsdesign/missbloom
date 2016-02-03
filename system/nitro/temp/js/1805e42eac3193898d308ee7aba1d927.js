
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
				minPrice     : 2990,
				maxPrice     : 3990,
				minPriceValue: 2990,
				maxPriceValue: 3990,
		    showButton   : 0,
		    showPrice    : 1,
		    showCounter  : 1,
				manualPrice  : 0,
		    total        : 12,
        link         : 'http://missbloom.ru/compositions/rose-in-box',
		    path         : '61_89',
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