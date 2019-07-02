<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  </head>
  <body>
    <form>
      <div class="form-group">
        <label for="subject">
          To get Gaata Sankhya:
        </label>

        <select class="form-control" id="subject" required="">
          <option value="" selected=""> Janpad </option>
          <option value="1"> Subject 1 </option>
          <option value="2"> Subject 2 </option>
          <option value="3"> Subject 3 </option>
        </select>

        <select class="form-control" id="subject" required="">
          <option value="" selected=""> Tehsil </option>
          <option value="1"> Subject 1 </option>
          <option value="2"> Subject 2 </option>
          <option value="3"> Subject 3 </option>
        </select>

        <select class="form-control" id="subject" required="">
          <option value="" selected=""> Village Name/Village Code </option>
          <option value="1"> Subject 1 </option>
          <option value="2"> Subject 2 </option>
          <option value="3"> Subject 3 </option>
        </select>
      </div>

      <div class="form-group">
        <label for="message">
          Description Of Share Added
        </label>
        <textarea class="form-control" id="message" required=""></textarea>
      </div>

      <div class="form-group">
        <label for="message">
          Description Of Share Removed
        </label>
        <textarea class="form-control" id="message" required=""></textarea>
      </div>
      <div class="form-group">
        <label for="email">
          Mall Guzari(Revenue)
        </label>
        <input class="form-control" type="text" required="">
      </div>

      <div class="form-group">
        <div class="form-row">
          <div class="col">
            <label for="email">
              Order Number
            </label>
            <input class="form-control" type="text" required="">
          </div>
          <div class="col-md-6">
            <label for="hire-date">
              Date
            </label>
            <input class="form-control" id="hire-date" type="date" required="">
          </div>
        </div>
      </div>

      <div class="form-group">
        <div class="form-row">
          <div class="col">
            <label for="email">
              Remark
            </label>
            <input class="form-control" type="text">
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="form-row">
          <div class="col-md-6 offset-3 button">
            <button class="btn btn-primary btn-block" type="submit">
              Submit
            </button>
          </div>
        </div>
      </div>
    </form>
  </body>
</html>

