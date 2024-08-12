/*
lasEdades
map edad [juan,pedro,maria]
[30,7,20]

edadPromedio
sum (map edad [juan,pedro,maria]) / length [juan,pedro,maria]
19

esDelGrupo
elem juan [juan,pedro,maria]
True

eliminar
eliminar juan [juan,pedro,maria]
[pedro,maria]

losQueTienenNombreConA
filtrar tieneAEnElNombre [juan,pedro,maria]
[juan,maria]

darVuelta
reverse [juan,pedro,maria]
[maria,pedro,juan]

todosConAEnElNombre
all tieneAEnElNombre [juan,pedro,maria]
False

alguienConAEnElNombre
any tieneAEnElNombre [juan,pedro,maria]
True
*/

%grupo(noMoreHaskell,[juan,pedro,maria]).
%grupo(borbotones,[tito,lito]).



integranteDeGrupo(noMoreHaskell,juan).
integranteDeGrupo(noMoreHaskell,pedro).
integranteDeGrupo(noMoreHaskell,maria).
integranteDeGrupo(borbotones,tito).
integranteDeGrupo(borbotones,lito).


edad(perez,juan,30).
edad(perez, pedro,7).
edad(garcia,maria,20).
edad(garcia,juan,20).
edad(fernandez,maria,30).
edad(perez,maria,30).



tieneAEnElNombre(maria).
tieneAEnElNombre(juan).
tieneAEnElNombre(patricio).

lasEdades(E):-edad(_,E).

algunoTieneAEnElNombre:-
    edad(P,_),
    tieneAEnElNombre(P).

todosConAEnElNombre:-
   forall(edad(P,_),
        tieneAEnElNombre(P)).


esDelGrupo(P):-edad(P,_).


% :- suma  / cant.

/*
cantidadPersonas(C,Nombre):-
    grupo(Nombre,Integrantes),
    length(Integrantes,C). 
*/
capicua(Lista):-
    reverse(Lista,Lista).


cantidadPersonas(C,Nombre):-
    conseguimeLaLista(Nombre,Integrantes),
    length(Integrantes,C). 

esUnaEdad(X):-edad(_,_,X).

conjunto(L,E):-
    distinct(esUnaEdad(E)),
    findall((A,N),edad(A,N,E),L).

hijo(elizabeth,carlos).
hijo(elizabeth,andres).
hijo(carlos,guillermo).
hijo(diana,guillermo).
hijo(guillermo,juan).
hijo(guillermo,maria).

descendiente(A,B):-hijo(A,B).
descendiente(A,B):-
    hijo(A,Alguien),
    descendiente(Alguien,B).

bisabuelo(Bisa,Bisn):-
    hijo(Bisa,Alguien),
    abuelo(Alguien,Bisn).

abuelo(Abuelo,Nieto):-
    hijo(Abuelo,Alguien),
    hijo(Alguien,Nieto).




ultimo([_|XS],X):-ultimo(XS,X).
ultimo([X],X).

suma([],0).
suma([X|Xs],N):-
    suma(Xs,M),
    N is M + X.