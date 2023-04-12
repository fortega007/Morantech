
function simule() {
  var qtdMorangoKg = Number(input_qtdMorangoKg.value);
  var precoMorangoKg = Number(input_valorMorango.value);
  var porcDesperdicioCliente = input_porcEstimadaCliente.value;
  var porcDesperdicioMedia = 30;

  if (porcDesperdicioCliente != "") {
    porcDesperdicioMedia = Number(porcDesperdicioCliente);
  }

  if (qtdMorangoKg <= 0) {
    alert("Por favor, digite uma quantidade de Kg válida!");
  }

  if (precoMorangoKg <= 0) {
    alert("Por favor, digite um preço válido!");
  }

  if (porcDesperdicioMedia <= 5) {
    alert("Por favor, digite uma porcentagem válida!");
  }

  if (porcDesperdicioMedia > 100) {
    alert("Por favor, digite uma porcentagem válida!");
  }
  // CÁLCULO SEM MORANTECH
  var precoTotalMorango = qtdMorangoKg * precoMorangoKg;
  var perdaKgMorango = qtdMorangoKg * (porcDesperdicioMedia / 100);
  var perdaPorcRenda = precoTotalMorango * (porcDesperdicioMedia / 100);
  var lucroTotal = precoTotalMorango - perdaPorcRenda;

  // CÁLCULO COM MORANTECH
  var economiaKgMorango = porcDesperdicioMedia - 5;
  var lucroTotalMoranthec = precoTotalMorango * 0.95;
  var economiaTotalMoranthec = lucroTotalMoranthec - lucroTotal;

  p_respostas.innerHTML = `Transportando <b>${qtdMorangoKg} kg</b> de morango no preço de <b>R$${precoMorangoKg}</b>, você teria: <br>`;

  p_resposta1.innerHTML += `<h4>SEM A TECNOLOGIA MORANTECH</h4>
Haveria uma perda de <b style="color: red">${perdaKgMorango}Kg</b> de morango; <br>
Isso representa <b style="color: red">R$ ${perdaPorcRenda}</b> perdidos; <br>
Ao final do transporte receberia no total <b style="color: red">R$ ${lucroTotal}</b>
.`;

  p_resposta2.innerHTML += `<h4>COM A TECNOLOGIA MORANTECH</h4> 
<b style="color: green">${economiaKgMorango}kg</b>   de morango deixariam de ser perdidos; <br>
Haveria uma economia de <b style="color: green">R$ ${economiaTotalMoranthec}</b>; <br>
Ao final do transporte receberia no total <b style="color: green">R$ ${lucroTotalMoranthec}</b>.`;
}
