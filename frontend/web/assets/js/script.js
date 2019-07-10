$(document).ready(function () {
  // Default option
  var option = ['<option value="0" selected="selected">जनपद चुने</option>',
    '<option value="0" selected="selected">तहसील चुने</option>',
    '<option value="0" selected="selected">ग्राम चुने</option>'];

  // Select each of the elements
  var dropDowns = [$('#first'), $('#second'), $('#third')];
  var firstDropDown = $('#first');
  var secondDropDown = $('#second');
  var thirdDropDown = $('#third');
  var varasat = $('#varasat');
  var dhara34 = $('#dhara34');

  // Hold selected option
  var firstSelection = '';
  var secondSelection = '';
  var thirdSelection = '';

  // Method to clear dropdowns down to a given level
  var clearDropDown = function (arrayObj, startIndex) {
    $.each(arrayObj, function (index, value) {
      if (index >= startIndex) {
        $(value).html(option[index]);
      }
    });
  };

  // Method to disable dropdowns down to a given level
  var disableDropDown = function (arrayObj, startIndex) {
    $.each(arrayObj, function (index, value) {
      if (index >= startIndex) {
        $(value).attr('disabled', 'disabled');
      }
    });
  };

  // Method to disable dropdowns down to a given level
  var enableDropDown = function (that) {
    that.removeAttr('disabled');
  };

  // Method to generate and append options
  var generateOptions = function (element, data, index) {
    var options = '';
    for (var i = 0; i < data.length; i++) {
      options += '<option value="' + data[i].code + '">' +
              data[i].name + '</option>';
    }
    element.append(options);
  };

  // Method to fetch data from API to fill dropdowns
  var fillDropDowns = (index, url, obj) => {
    clearDropDown($('select'), index);
    disableDropDown($('select'), index);

    $.getJSON(url, function (data) {
      generateOptions(dropDowns[index], data[obj], index);
      enableDropDown(dropDowns[index]);
    });
  };

  dhara34.click(function () {
    $('#mode').val("Dhaara 34");
    var url = "./assets/js/districts.json";
    var obj = "data";
    fillDropDowns(0, url, obj);
  });

  varasat.click(function () {
    $('#mode').val("वरासत");
    var url = "./assets/js/districts.json";
    var obj = "data";
    fillDropDowns(0, url, obj);
  });

  // Selection handler for first level dropdown
  firstDropDown.on('change', function () {
    // Get selected option
    firstSelection = firstDropDown.val();
    var url = "./assets/js/tehsils.json";
    var obj = firstSelection;
    fillDropDowns(1, url, obj);

  });

  // Selection handler for second level dropdown
  secondDropDown.on('change', function () {
    secondSelection = secondDropDown.val();
    var url = "./assets/js/villages.json";
    var obj = secondSelection;
    fillDropDowns(2, url, obj);
  });

});





