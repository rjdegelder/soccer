$ ->
  $('.datepicker').datepicker
    dateFormat: "dd/mm/yy",
    todayHighlight: true,
    todayBtn: 'linked',
    autoclose: true

  $('.timepicker').timepicker
    timeFormat: "H:i",
    scrollDefaultTime: '12:00',
    step: 15