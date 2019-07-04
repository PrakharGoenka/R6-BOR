
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
  // Hold selected option;

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
  var generateOptions = function (element, data) {
    var options = '';
    for (var i = 0; i < data.length; i++) {
      options += '<option value="' + data[i].id + '">' + data[i].first_name + '</option>';
    }
    element.append(options);
  };

  // Method to fetch data from API to fill dropdowns
  var fillDropDowns = (index, url) => {
    clearDropDown($('select'), index);
    disableDropDown($('select'), index);

    $.ajax({
      type: 'GET',
      url: url,
      contentType: 'application/json; charset=utf-8',

      success: function (data) {
        generateOptions(dropDowns[index], data.data);
        enableDropDown(dropDowns[index]);
      },

      error: function (x, e) {
        alert('server error occoured');
        if (x.status == 0) {
          alert('0 error');
        } else if (x.status == 404) {
          alert('404 error');
        } else if (x.status == 500) {
          alert('500 error');
        } else if (e == 'parsererror') {
          alert('Error.nParsing JSON Request failed.');
        } else if (e == 'timeout') {
          alert('Time out.');
        } else {
          alert(x.responseText);
        }
      }
    });
  };

  dhara34.click(function () {
    $("#mode").val("धारा ३४");
    var url = 'https://reqres.in/api/users?page=2';
    fillDropDowns(0, url);
  });

  varasat.click(function () {
    $("#mode").val("वरासत");
    var url = 'https://reqres.in/api/users?page=2';
    fillDropDowns(0, url);
  });

  // Selection handler for first level dropdown
  firstDropDown.on('change', function () {

    // Get selected option
    firstSelection = firstDropDown.val();

    var url = 'https://reqres.in/api/users?page=2';
    fillDropDowns(1, url);

  });

  // Selection handler for second level dropdown
  secondDropDown.on('change', function () {
    secondSelection = secondDropDown.val();

    var url = 'https://reqres.in/api/users?page=2';
    fillDropDowns(2, url);

  });

  // Selection handler for third level dropdown
  thirdDropDown.on('change', function () {
    thirdSelection = thirdDropDown.val();

  });
});
