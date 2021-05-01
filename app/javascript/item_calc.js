function item_calc () {
  const priceForm = document.getElementById('item-price');
    priceForm.addEventListener("input", () => {
      const formValue = priceForm.value;
      const salesComm = document.getElementById('add-tax-price');
      salesComm.innerHTML = (Math.floor(formValue * 0.1));
      const salesProf = document.getElementById('profit');
      const value_result = formValue * 0.1
      salesProf.innerHTML = (Math.floor(formValue - value_result));
    });
}

window.addEventListener('load', item_calc);