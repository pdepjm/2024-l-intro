tiene(costa,rusa).
tiene(costa,fantasma).
tiene(costa,basquet).
tiene(agua,rio).
tiene(costa,maquina).
tiene(costa,mar).

requisito(rusa, edad(12)).
requisito(fantasma, altura(2.1)).
requisito(maquina, altura(1.3)).
requisito(mar, altura(1.8)).
requisito(basquet, altura(2.3)).

%Solucion procedural, con listas innecesarias
hayAlgunaAtraccionQuePidaAlturaMayorA2m(Parque):-
    findall(Atr, tiene(Parque,Atr), ListaA),
    member(Atraccion,ListaA),
    requisito(Atraccion,altura(A)),
    A > 2.

%Solucion procedural, con listas innecesarias
hayAlgunaAtraccionQuePidaAlturaMayorA2m(Parque):-
    tiene(Parque,Atr),
    requisito(Atraccion,altura(A)),
    A > 2.