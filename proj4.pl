author(bill).
author(carl).
author(inez).
author(stacy).

title(baby).
title(dancing).
title(happy).
title(magnet).

ttime(t15).
ttime(t31).
ttime(t38).
ttime(t55).

view(mil4).
view(mil5).
view(mil6).
view(mil7).

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
	((member([_,happy,_  ,mil6],Quads));
    (member([_,_    ,t15,mil6],Quads)) ),
	not(member([_,happy,t15,_],Quads)),

	%Rule 2:
	((member([_,magnet,_  ,mil7],Quads));
	 (member([_,magnet,t31,_   ],Quads)) ),
	not(member([_,_,t31,mil7],Quads)),	

	%Rule 3:
	member([stacy,_,t15,_],Quads),
	
	%Rule 4:
	not(member([_,baby,t38,_],Quads)),
	
	%Rule 5:
	((member([carl,_,_,mil6],Quads),
	  member([_,dancing,_,mil4],Quads));
	 (member([carl,_,_,mil7],Quads),
	  member([_,dancing,_,mil5],Quads)) ),

	%Rule 6:
	member([bill,_,_,mil4],Quads),
	
	%Rule 7:
	not(member([inez,happy,t31,_],Quads)),

	%Rule 8:
	((member([carl,magnet,_,_],Quads),
	  member([_,_,t15,mil6],Quads));
	 (member([carl,_,_,mil6],Quads),
     member([_,magnet,t15,_],Quads)) ),
	 not(member([carl,_,t15,_],Quads)),
	 not(member([_,magnet,_,mil6],Quads)),

	tell(bill, BillTitle,  BillTime,  BillView),
   tell(carl, CarlTitle,  CarlTime,  CarlView),
	tell(inez, InezTitle,  InezTime,  InezView),
	tell(stacy,StacyTitle, StacyTime, StacyView).

all_different([H|T]) :- member(H,T), !, fail.
all_different([_|T]) :- all_different(T).
all_different([_]).

tell(W,X,Y,Z) :-
	write(W),write(' is the author of the '),write(X),write(' video.'),
   write(Y),write('seconds and '), write(Z), write('million views'),nl.

