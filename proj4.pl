author(bill).
author(carl).
author(inez).
author(stacy).

title(baby).
title(dancing).
title(happy).
title(magnet).

ttime(fifteen).
ttime(thirty-one).
ttime(thirty-eight).
ttime(fifty-five).

view(four).
view(five).
view(six).
view(seven).

solve :-
	
%anchor: Authors!
	
	title(BillTitle),title(CarlTitle),title(InezTitle),title(StacyTitle),
	all_different([BillTitle,CarlTitle,InezTitle,StacyTitle]),

	ttime(BillTime),ttime(CarlTime),ttime(InezTime),ttime(StacyTime),
	all_different([BillTime,CarlTime,InezTime,StacyTime]),

	view(BillView),view(CarlView),view(InezView),view(StacyView),
	all_different([BillView,CarlView,InezView,StacyView]),

	Quads =[ [bill, BillTitle,  BillTime,  BillView],
            [carl, CarlTitle,  CarlTime,  CarlView],
			   [inez, InezTitle,  InezTime,  InezView],
				[stacy,StacyTitle, StacyTime, StacyView]],

	%Rule 1:
	((member([_,happy,_  ,six],Quads));
    (member([_,_    ,fifteen,six],Quads)) ),
	not(member([_,happy,fifteen,_],Quads)),

	%Rule 2:
	((member([_,magnet,_  ,seven],Quads));
	 (member([_,magnet,thirty-one,_   ],Quads)) ),
	not(member([_,_,thirty-one,seven],Quads)),	

	%Rule 3:
	member([stacy,_,fifteen,_],Quads),
	
	%Rule 4:
	not(member([_,baby,thirty-eight,_],Quads)),
	
	%Rule 5:
	((member([carl,_,_,six],Quads),
	  member([_,dancing,_,four],Quads));
	 (member([carl,_,_,seven],Quads),
	  member([_,dancing,_,five],Quads)) ),
	not(member([carl,dancing,_,_],Quads)),
	
	%Rule 6:
	member([bill,_,_,four],Quads),
	
	%Rule 7:
	not(member([inez,happy,thirty-one,_],Quads)),
	not(member([_,happy,thirty-one,_],Quads)),
	not(member([inez,happy,_,_],Quads)),
	not(member([inez,_,thirty-one,_],Quads)),

	%Rule 8:
	((member([carl,magnet,_,_],Quads),
	  member([_,_,fifteen,six],Quads));
	 (member([carl,_,_,six],Quads),
     member([_,magnet,fifteen,_],Quads)) ),
	 not(member([carl,_,fifteen,_],Quads)),
	 not(member([_,magnet,_,six],Quads)),

	tell(bill, BillTitle,  BillTime,  BillView),
	tell(carl, CarlTitle,  CarlTime,  CarlView),
	tell(inez, InezTitle,  InezTime,  InezView),
	tell(stacy,StacyTitle, StacyTime, StacyView).

all_different([H|T]) :- member(H,T), !, fail.
all_different([_|T]) :- all_different(T).
all_different([_]).

tell(W,X,Y,Z) :-
	write(W), write('\'s video, '),write('"'),write(X),
   write('"'),write(', has '),write(Z),write(' million views '),
   write('and is '),write(Y),write(' seconds long.'), nl.

