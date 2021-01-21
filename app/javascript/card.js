const pay = () => {
  console.log("OK")
  Payjp.setPublicKey("pk_test_18872d8c63d1eb1600b43558");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order_consumer[order[number]]"),
      cvc: formData.get("order_consumer[order[cvc]]"),
      exp_month: formData.get("order_consumer[order[exp_month]]"),
      exp_year: `20${formData.get("order_consumer[order[exp_year]]")}`,
    };
    
    console.log(card);
   
    Payjp.createToken(card, (status, response) => {
       
      if (status == 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        
      }
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);