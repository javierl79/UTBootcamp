// Input field and button
var $tbody = document.querySelector("tbody");
//var $datetimeInput = document.querySelector("#datetime");
var $stateInput = document.querySelector("#state");
var $searchBtn = document.querySelector("#search");

// Add listener to the searchBt when clicked
$searchBtn.addEventListener("click", handleSearchButtonClick);

//I could not make the search work for the date entry "MM/DD/YYYY"

// function renderTable() {
//   $tbody.innerHTML = "";
//   for (var i = 0; i < filtereddatetime.length; i++) {
//     // Get get the current address state object and its fields
//     var datetime = filtereddatetime[i];
//     var fields = Object.keys(datetime);
//     // Create a new row in the tbody, set the index to be i + startingIndex
//     var $row = $tbody.insertRow(i);
//     for (var j = 0; j < fields.length; j++) {
//       // For every field in the address object, create a new cell at set its inner text to be the current value at the current address's field
//       var field = fields[j];
//       var $cell = $row.insertCell(j);
//       $cell.innerText = datetime[field];
//     }
//   }
// }



// Set filteredState to dataSet from data.js file
var filteredState = dataSet;

// Render a Table to the body of the webpage

function renderTable() {
  $tbody.innerHTML = "";
  for (var i = 0; i < filteredState.length; i++) {
    var state = filteredState[i];
    var fields = Object.keys(state);
    var $row = $tbody.insertRow(i);
    for (var j = 0; j < fields.length; j++) {
      var field = fields[j];
      var $cell = $row.insertCell(j);
      $cell.innerText = state[field];
    }
  }
}

// function handleSearchButtonClick() {
//   //   var filterdatetime = $datetimeInput.value.trim(); //.toLowerCase();
//   filtereddatetime = dataSet.filter(function(datetime) {
//     var enterdatetime = datetime.datetime; //.toLowerCase();
//     return enterdatetime === filterdatetime;
//   });
//   renderTable();
// }


function handleSearchButtonClick() {
  // Format the user's State entry by timming any spaces infront or at end of text and matching to entries in dataSet
  var filterState = $stateInput.value.trim().toLowerCase();

  // Set filteredState to an array of all entries that match the state entered
  filteredState = dataSet.filter(function(state) {
    var addressState = state.state.toLowerCase();

    // Return a table where the state entered matches the state in dataSet
    return addressState === filterState;
  });
  renderTable();
}

// Show the entire dataSet
renderTable();
