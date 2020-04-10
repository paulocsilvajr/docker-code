<?php

// função/subrotina
function exibeMensagem(string $mensagem)
{
    echo $mensagem . '<br>';
}

// pode ser informado o tipo do parâmetro para verificar se 
// o valor informado é correspondente a esse tipo
function sacar(array $conta, float $valorASacar): array
{
    if ($valorASacar > $conta['saldo']) {
        exibeMensagem("Você não pode sacar esse valor");
    } else {
        $conta['saldo'] -= $valorASacar;
    }
    return $conta;
}

function depositar(array $conta, float $valorADepositar): array
{
    if ($valorADepositar > 0) {
        $conta['saldo'] += $valorADepositar;
    } else {
        exibeMensagem("Depositos devem ser positivos");
    }
    return $conta;
}

// função com parâmetro como referência, semelhante a um ponteiro
function titularComLetrasMaiusculas(array &$conta)
{
    $conta['titular'] = mb_strtoupper($conta['titular']);
}

function exibeConta(array $conta)
{
    ['titular' => $titular, 'saldo' => $saldo] = $conta;
    echo "<li>Titular: $titular. Saldo: $saldo</li>";
}
