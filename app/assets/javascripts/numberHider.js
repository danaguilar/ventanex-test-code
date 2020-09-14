// Because of turbolinks we are unable to simply add events to individual elements since they may be reloaded without reloading the page
// Instead we can bind the click event on the document itself and only fire the function if the event came from the given element
$(document).on("click", "[data-hide-button]", (event) => {
  var accountNumber = $(event.target).siblings("[data-account-number]")[0]
  $(event.target).siblings("[data-account-number]")[0].textContent = sanitizeAccountNumber(accountNumber.textContent)
})

function sanitizeAccountNumber(accountNumber) {
  var portionToFilter = accountNumber.slice(0, -4);

  // The replace function is incompatible with IE. The following is a much simpler way using
  // a more modern approach
  // 
  // return accountNumber.replace(portionToFilter, "*".repeat(portionToFilter.length))

  // This way is compatible with all versions of EI
  var replacementString = "";
  for(var i = 0; i < portionToFilter.length; i++) {
    replacementString = "*" + replacementString;
  }

  return accountNumber.replace(portionToFilter, replacementString);
}