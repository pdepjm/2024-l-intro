/*
esta banana [banana,pera,limon]
filter esRica [banana,pera,limon]
length [banana,pera,limon]   *
head [banana,pera,limon] * 
map color [banana,pera,limon]
filter (==amarillo.color) [banana,pera,limon]
agregar melon [banana,pera,limon] 
*/

color(banana,amarillo).
color(limon,amarillo).
color(pera,verde).
color(durazno,naranja).

primerFrutaDeEstacion(Fruta,Estacion):-
    frutas(Frutas,Estacion),nth0(0,Frutas,Fruta).

ultimaFrutaDeEstacion(Fruta,Estacion):-
        frutas(Frutas,Estacion),
        length(Frutas,C),
        nth1(C,Frutas,Fruta).
    
frutas([banana,limon,pera], invierno).
frutas([melon,durazno],verano).

frutaDeEstacion(banana,invierno,sabroso).
frutaDeEstacion(banana,verano,desabrido).
frutaDeEstacion(limon,invierno,rico).
frutaDeEstacion(pera,invierno,rico).
frutaDeEstacion(pera,invierno,desabrido).
frutaDeEstacion(melon,verano,rico).
frutaDeEstacion(durazno,verano,sabroso).
esUnaEstacion(invierno).
esUnaEstacion(verano).
esUnaEstacion(primavera).



ultimaFrutaDeEstacion2(Fruta,Estacion):-
    esUnaEstacion(Estacion),
    todasLasFrutasDe(Frutas,Estacion),
    length(Frutas,C),
    nth1(C,Frutas,Fruta).

ultimaFrutaDelAnio(Fruta):-
        todasLasFrutasDe(Frutas,Estacion),
        length(Frutas,C),
        nth1(C,Frutas,Fruta).
    

todasLasFrutasDe(Frutas,Estacion):-
    findall(Fruta,frutaDeEstacion(Fruta,Estacion),Frutas).

esDeInvierno(Fruta):-
    frutas(Frutas,invierno),
    member(Fruta,Frutas).

esRica(banana).
esRica(pera).
esRica(coca).

esUnSabor(rico).
esUnSabor(sabroso).
esUnSabor(desabrido).


nn(Lista,S,E):-

    findall(F,(frutaDeEstacion(F,E,S),color(F,verde)),Lista).

coloresDeFrutas(Estacion,Color):-
    frutas(Frutas,Estacion),
    member(Fruta,Frutas),
    color(Fruta,Color).


%ultimo([X],X).
ultimo([_|XS],X):-ultimo(XS,X).


suma([],0).
suma([X|Xs],N):-
    suma(Xs,M),
    N is M + X.

minimo([X],X).
minimo([X|Xs],N):-
    minimo(Xs,M),
    elMenorEntre(M,X,N).

desconocido([],[]).
desconocido([X|XS],[X|YS]):-desconocido(XS,YS).
desconocido([X|XS],YS):-desconocido(XS,YS).



 