var datepickerOptions = {
  format: 'YYYY-MM-DD HH:mm:ss',
  showTodayButton: true,
  showClear: true
};

$(function () {
  $('#reservation_from').datetimepicker(datepickerOptions);
  $('#reservation_to').datetimepicker(datepickerOptions);
});
