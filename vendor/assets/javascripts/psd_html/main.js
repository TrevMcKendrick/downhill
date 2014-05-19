(function($) {
	$(function() {
		$($('.tabs .active a').attr('href')).show();

		$('.tabs a').on('click', function(e) {
			e.preventDefault();
			var _self = $(this);
			var _targetTab = _self.attr('href');
			var _oldTab = $('.tabs .active a').attr('href');

			$('.tabs .active').removeClass('active');
			_self.parent().addClass('active');
			$(_oldTab).hide();
			$(_targetTab).show();
		});

		if ($('.event-form').length) {
			$('select').customSelect();

			$('input[name=team]').on('click', function() {
				var _value = $('input[name=team]:checked').val();

				$('.join-team').hide();
				$('.create-team').hide();

				if (_value == 1) {
					$('.join-team').show();
				}

				if (_value == 2) {
					$('.create-team').show();
				}
			});

			$('#exp-date').datepicker();
			$('#exp-date').datepicker("option", "dateFormat", "d - MM yy");
		}

		// Placeholder fallback
		if (!("placeholder" in document.createElement("input"))) {
			$("input[placeholder], textarea[placeholder]").each(function() {
				var val = $(this).attr("placeholder");
				if (this.value == "") {
					this.value = val;
				}

				$(this).focus(function() {
					if (this.value == val) {
						this.value = "";
					}
				}).blur(function() {
					if ($.trim(this.value) == "") {
						this.value = val;
					}
				})
			});
		}
	});
})(window.jQuery);