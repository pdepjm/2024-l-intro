ubicacion(charcas,coord(34,79)).
ubicacion(amazonas,coord(14,39)).
ubicacion(bsas,alLadoDel(atlantico,rioDeLaPlata,20)).
ubicacion(antartida,polo(sur)).
%poblacion(charcas,40000).

estaMasAlNorte(Lugar,OtroLugar):-
    ubicacion(Lugar,coord(Lat,_)),
    ubicacion(OtroLugar,coord(OtraLat,_)),
    Lat > OtraLat.


estaMasAlNorte(Lugar,OtroLugar):-
    ubicacion(Lugar,_),
    ubicacion(OtroLugar,polo(sur)).


distancia(10).

estanCerca(Lugar,OtroLugar):-
    ubicacion(Lugar,Coord),
    ubicacion(OtroLugar,OtraCoord),
    distancia(Distancia),
    distanciaReal(Coord,OtraCoord,DistReal),
    DistReal < Distancia.


distanciaReal(coord(X,Y),coord(X1,Y1),DistReal):-
    DistReal is X - X1.
distanciaReal(polo(_),coord(X,Y),Dist):-Dist is X * 130.

mismoHemisferio(Lugar,OtroLugar):-
    ubicacion(Lugar,Coordenada),
    ubicacion(OtroLugar,OtraCoordenada),
    coincidendenciaHemisferica(Coordenada,OtraCoordenada).


coincidendenciaHemisferica( C1, C2):- 
coincidendenciaHemisferica( coord(Lat1,Long1), coord(Lat2,Long2)):- 