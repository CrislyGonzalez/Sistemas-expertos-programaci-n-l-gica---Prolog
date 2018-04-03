main :- identificando.

identificando:-
  retractall(known(_,_,_)),
  obtenerDatos(F),nl,cerrarConexion.


identificando:-
  write('No pudimos identificar el problema'),nl.


respuesta(X):-abrirConexion, odbc_query('prolog', 'SELECT * FROM datos',row(_,_,_,_,_,_,Problema,_,Solucion)),
	write('Problema: '),write(Problema),nl,write('Solucion: '),write(Solucion).

respuesta2(X):-abrirConexion,solucion(S),problema(P).


abrirConexion:-
	odbc_connect('bdpreguntas',_, [user(root)
		    ,password(''),alias(prolog),
		     open(once)]).

cerrarConexion:-
	 odbc_disconnect('prolog').


obtenerDatos2(F):- abrirConexion,odbc_query('prolog', 'SELECT * FROM prueba',F).



obtenerDatos(F):- abrirConexion,
	          odbc_query('prolog', 'SELECT * FROM datos',
			     row(_,Dconexion,Dalertas,Dso,Dmensaje,
				Dreinicio,P,Dtipo,S)),

		  conexion(Dconexion),
		  alertas(Dalertas),
		  sistemaOp(Dso),
		  mensaje(Dmensaje),
		  reinicio(Dreinicio),
		  tipo(Dtipo),nl, write('Problema: '),write(P)
		  ,nl,write('Solucion: '), write(S).



conexion(X):-ask(conexion,X).

tipo(X):-ask(tipo,X).

alertas(X):-ask(alertas,X).

sistemaOp(X):- ask(sistemaOp,X).

reinicio(X):-ask(reinicio,X).

mensaje(X):- ask(mensaje,X).



ask(Attribute,Value):-
  known(yes,Attribute,Value),       % succeed if we know its true
  !.                                % and dont look any further
ask(Attribute,Value):-
  known(_,Attribute,Value),         % fail if we know its false
  !, fail.

ask(Attribute,_):-
  known(yes,Attribute,_),           % fail if we know its some other value.
  !, fail.                          % the cut in clause #1 ensures that if
                                    % we get here the value is wrong.
ask(A,V):-
  write(A:V),                       % if we get here, we need to ask.
  write('? (yes or no): '),
  read(Y),                          % get the answer
  asserta(known(Y,A,V)),            % remember it so we dont ask again.
  Y = yes.                          % succeed or fail based on answer.

% "menuask" is like ask, only it gives the user a menu to to choose
% from rather than a yes on no answer. In this case there is no
% need to check for a negative since "menuask" ensures there will
% be some positive answer.

menuask(Attribute,Value,_):-
  known(yes,Attribute,Value),       % succeed if we know
  !.
menuask(Attribute,_,_):-
  known(yes,Attribute,_),           % fail if its some other value
  !, fail.

menuask(Attribute,AskValue,Menu):-
  nl,write('What is the value for '),write(Attribute),write('?'),nl,
  display_menu(Menu),
  write('Enter the number of choice> '),
  read(Num),nl,
  pick_menu(Num,AnswerValue,Menu),
  asserta(known(yes,Attribute,AnswerValue)),
  AskValue = AnswerValue.           % succeed or fail based on answer

display_menu(Menu):-
  disp_menu(1,Menu), !.             % make sure we fail on backtracking

disp_menu(_,[]).
disp_menu(N,[Item | Rest]):-        % recursively write the head of
  write(N),write(' : '),write(Item),nl, % the list and disp_menu the tail
  NN is N + 1,
  disp_menu(NN,Rest).

pick_menu(N,Val,Menu):-
  integer(N),                       % make sure they gave a number
  pic_menu(1,N,Val,Menu), !.        % start at one
  pick_menu(Val,Val,_).             % if they didn't enter a number, use
                                    % what they entered as the value

pic_menu(_,_,none_of_the_above,[]). % if we've exhausted the list
pic_menu(N,N, Item, [Item|_]).      % the counter matches the number
pic_menu(Ctr,N, Val, [_|Rest]):-
  NextCtr is Ctr + 1,               % try the next one
  pic_menu(NextCtr, N, Val, Rest).




