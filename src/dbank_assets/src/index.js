import { dbank } from "../../declarations/dbank";

const update = async () => {
  const currentAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = currentAmount.toFixed(2);
}

window.addEventListener("load", update())

document.querySelector("form").addEventListener("submit", async function (event) {

  event.preventDefault();

  const button = event.target.querySelector("#submit-btn");
  button.setAttribute("disabled", true);

  const inputAmount = document.getElementById("input-amount").value;
  const outputAmount = document.getElementById("withdrawal-amount").value;

  if (inputAmount.length != 0)
    await dbank.topUp(parseFloat(inputAmount));

  if (outputAmount.length != 0)
    await dbank.withdraw(parseFloat(outputAmount));

  await dbank.compound();

  update();

  button.removeAttribute("disabled");
  document.getElementById("input-amount").value = "";
  document.getElementById("withdrawal-amount").value = "";

})

