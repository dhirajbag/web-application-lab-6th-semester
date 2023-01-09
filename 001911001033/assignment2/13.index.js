function handleResponseForMakers(componentName, target) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      // success and response is received
      target.innerHTML = this.responseText;
    }
  }
  xhttp.open("POST", `13.getMakers.jsp`, true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
  xhttp.send("component=" + componentName);
}

handleResponseForMakers("HDD", document.getElementById('hdd-makers'))


handleResponseForMakers("MONITOR", document.getElementById('monitor-makers'))


handleResponseForMakers("RAM", document.getElementById('ram-makers'))


handleResponseForMakers("MBOARD", document.getElementById('mboard-makers'))



function handleResponseForModel(componentName, maker, target) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      // success and response is received
      target.innerHTML = this.responseText;
    }
  }
  xhttp.open("POST", `13.getModels.jsp`, true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
  xhttp.send("component=" + componentName + "&manufacturer=" + maker);
}

document
  .getElementById("hdd-makers")
  .addEventListener(
    'change',
    function () {
      handleResponseForModel(
        "HDD", document.getElementById('hdd-makers').value, document.getElementById('hdd-model')
      )
    });

document
  .getElementById("monitor-makers")
  .addEventListener(
    'change',
    function () {
      handleResponseForModel(
        "MONITOR",
        document.getElementById('monitor-makers').value,
        document.getElementById('monitor-model')
      )
    });

document
  .getElementById("ram-makers")
  .addEventListener(
    'change',
    function () {
      handleResponseForModel(
        "RAM",
        document.getElementById('ram-makers').value,
        document.getElementById('ram-model')
      )
    });

document
  .getElementById("mboard-makers")
  .addEventListener(
    'change',
    function () {
      handleResponseForModel(
        "MBOARD",
        document.getElementById('mboard-makers').value,
        document.getElementById('mboard-model')
      )
    });


let totalPrice = 0, totalResponse = 0;
function synchronizeAll(result) {
  totalResponse++;
  totalPrice += parseInt(result, 10);

  if (totalResponse === 4) {
    document.getElementById('total-price').innerHTML = totalPrice;
    totalPrice = 0;
    totalResponse = 0;
  }
}

function getPrice(component, maker, model) {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
      // success and response is received
      synchronizeAll(this.responseText);
    }
  }
  xhttp.open("POST", `13.getTotalPrice.jsp`, true);
  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded")
  xhttp.send('component=' + component + "&manufacturer=" + maker + "&model=" + model);
}

function checkTotalPrice(e) {
  e.preventDefault();

  var HddMaker = document.getElementById('hdd-makers').value;
  var HddModel = document.getElementById('hdd-model').value;
  getPrice("HDD", HddMaker, HddModel);

  var MonitorMaker = document.getElementById('monitor-makers').value;
  var MonitorModel = document.getElementById('monitor-model').value;
  getPrice("MONITOR", MonitorMaker, MonitorModel);

  var MboardMaker = document.getElementById('mboard-makers').value;
  var MboardModel = document.getElementById('mboard-model').value;
  getPrice("MBOARD", MboardMaker, MboardModel);

  var RamMaker = document.getElementById('ram-makers').value;
  var RamModel = document.getElementById('ram-model').value;
  getPrice("RAM", RamMaker, RamModel);
};