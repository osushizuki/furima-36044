window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
    inputValue = priceInput.value;

    const addTaxPrice = document.getElementById('add-tax-price');
    addTaxPrice.innerHTML = inputValue/10

    const Profit = document.getElementById('profit');
    Profit.innerHTML = inputValue*9/10
  })

});
